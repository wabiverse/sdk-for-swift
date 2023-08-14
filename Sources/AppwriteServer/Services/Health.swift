import AppwriteServerJSON
import AppwriteServerModels
import AsyncHTTPClient
import Foundation
import NIO

/// The Health service allows you to both validate and monitor your AppwriteServer server&#039;s health.
open class Health: Service {
  ///
  /// Get HTTP
  ///
  /// Check the AppwriteServer HTTP server is up and responsive.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func get(
  ) async throws -> AppwriteServerModels.HealthStatus {
    let path = "/health"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthStatus = { response in
      AppwriteServerModels.HealthStatus.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Antivirus
  ///
  /// Check the AppwriteServer Antivirus server is up and connection is successful.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getAntivirus(
  ) async throws -> AppwriteServerModels.HealthAntivirus {
    let path = "/health/anti-virus"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthAntivirus = { response in
      AppwriteServerModels.HealthAntivirus.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Cache
  ///
  /// Check the AppwriteServer in-memory cache server is up and connection is
  /// successful.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getCache(
  ) async throws -> AppwriteServerModels.HealthStatus {
    let path = "/health/cache"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthStatus = { response in
      AppwriteServerModels.HealthStatus.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get DB
  ///
  /// Check the AppwriteServer database server is up and connection is successful.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getDB(
  ) async throws -> AppwriteServerModels.HealthStatus {
    let path = "/health/db"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthStatus = { response in
      AppwriteServerModels.HealthStatus.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Certificates Queue
  ///
  /// Get the number of certificates that are waiting to be issued against
  /// [Letsencrypt](https://letsencrypt.org/) in the AppwriteServer internal queue
  /// server.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getQueueCertificates(
  ) async throws -> AppwriteServerModels.HealthQueue {
    let path = "/health/queue/certificates"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthQueue = { response in
      AppwriteServerModels.HealthQueue.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Functions Queue
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getQueueFunctions(
  ) async throws -> AppwriteServerModels.HealthQueue {
    let path = "/health/queue/functions"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthQueue = { response in
      AppwriteServerModels.HealthQueue.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Logs Queue
  ///
  /// Get the number of logs that are waiting to be processed in the AppwriteServer
  /// internal queue server.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getQueueLogs(
  ) async throws -> AppwriteServerModels.HealthQueue {
    let path = "/health/queue/logs"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthQueue = { response in
      AppwriteServerModels.HealthQueue.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Webhooks Queue
  ///
  /// Get the number of webhooks that are waiting to be processed in the AppwriteServer
  /// internal queue server.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getQueueWebhooks(
  ) async throws -> AppwriteServerModels.HealthQueue {
    let path = "/health/queue/webhooks"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthQueue = { response in
      AppwriteServerModels.HealthQueue.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Local Storage
  ///
  /// Check the AppwriteServer local storage device is up and connection is successful.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getStorageLocal(
  ) async throws -> AppwriteServerModels.HealthStatus {
    let path = "/health/storage/local"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthStatus = { response in
      AppwriteServerModels.HealthStatus.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Get Time
  ///
  /// Check the AppwriteServer server time is synced with Google remote NTP server. We
  /// use this technology to smoothly handle leap seconds with no disruptive
  /// events. The [Network Time
  /// Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol) (NTP) is
  /// used by hundreds of millions of computers and devices to synchronize their
  /// clocks over the Internet. If your computer sets its own clock, it likely
  /// uses NTP.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getTime(
  ) async throws -> AppwriteServerModels.HealthTime {
    let path = "/health/time"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.HealthTime = { response in
      AppwriteServerModels.HealthTime.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "GET",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }
}
