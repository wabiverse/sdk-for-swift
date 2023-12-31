import AsyncHTTPClient
import NIO
import NIOHTTP1

class StreamingDelegate: HTTPClientResponseDelegate {
  public typealias Response = HTTPClient.Response

  enum State {
    case idle
    case head(HTTPResponseHead)
    case body(HTTPResponseHead)
    case end
    case error(Swift.Error)
  }

  var state = State.idle
  let request: HTTPClient.Request

  public struct Progress {
    public var totalBytes: Int?
    public var transferredBytes: Int
  }

  private var progress = Progress(totalBytes: nil, transferredBytes: 0)

  private let reportHead: ((HTTPResponseHead) -> Void)?
  private let reportProgress: ((Progress) -> Void)?
  private var reportError: ((AppwriteServerError) -> Void)?
  private var sink: ((ByteBuffer) -> Void)?
  private var completion: (() -> Void)?

  public init(
    request: HTTPClient.Request,
    sink: ((ByteBuffer) -> Void)? = nil,
    reportHead: ((HTTPResponseHead) -> Void)? = nil,
    reportProgress: ((Progress) -> Void)? = nil,
    reportError: ((AppwriteServerError) -> Void)? = nil
  ) {
    self.request = request
    self.sink = sink
    self.reportHead = reportHead
    self.reportProgress = reportProgress
    self.reportError = reportError
  }

  func didSendRequestHead(task _: HTTPClient.Task<Response>, _ head: HTTPRequestHead) {
    if let totalBytesString = head.headers.first(name: "Content-Length"),
       let totalBytes = Int(totalBytesString)
    {
      progress.totalBytes = totalBytes
    }
  }

  func didSendRequestPart(task _: HTTPClient.Task<Response>, _ part: IOData) {
    progress.transferredBytes += part.readableBytes
    reportProgress?(progress)
  }

  func didReceiveHead(
    task: HTTPClient.Task<Response>,
    _ head: HTTPResponseHead
  ) -> EventLoopFuture<Void> {
    switch state {
    case .idle:
      state = .head(head)
      if let totalBytesString = head.headers.first(name: "content-length"),
         let totalBytes = Int(totalBytesString)
      {
        progress.totalBytes = totalBytes
      }
    case .head:
      preconditionFailure("Head already set")
    case .body:
      preconditionFailure("No head received before body")
    case .end:
      preconditionFailure("Request already processed")
    case .error:
      break
    }
    return task.eventLoop.makeSucceededFuture(())
  }

  func didReceiveBodyPart(
    task: HTTPClient.Task<Response>,
    _ part: ByteBuffer
  ) -> EventLoopFuture<Void> {
    switch state {
    case .idle:
      preconditionFailure("No head received before body")
    case let .head(head):
      state = .body(head)
    case let .body(head):
      state = .end
      progress.transferredBytes += part.readableBytes
      reportProgress?(progress)
      sink?(part)
      state = .body(head)
    case .end:
      preconditionFailure("Request already processed")
    case .error:
      break
    }
    return task.eventLoop.makeSucceededFuture(())
  }

  func didFinishRequest(task _: HTTPClient.Task<Response>) throws -> Response {
    switch state {
    case .idle:
      preconditionFailure("No head received before end")
    case let .head(head):
      return Response(host: request.host, status: head.status, version: head.version, headers: head.headers, body: nil)
    case let .body(head):
      return Response(host: request.host, status: head.status, version: head.version, headers: head.headers, body: nil)
    case .end:
      preconditionFailure("Request already processed")
    case let .error(error):
      throw error
    }
  }

  func didReceiveError(task _: HTTPClient.Task<Response>, _ error: Swift.Error) {
    state = .error(error)
    reportError?(AppwriteServerError(message: error.localizedDescription))
  }
}
