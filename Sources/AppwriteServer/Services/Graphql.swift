import AppwriteServerJSON
import AppwriteServerModels
import AsyncHTTPClient
import Foundation
import NIO

/// The GraphQL API allows you to query and mutate your AppwriteServer server using GraphQL.
open class Graphql: Service {
  ///
  /// GraphQL Endpoint
  ///
  /// Execute a GraphQL mutation.
  ///
  /// @param Any query
  /// @throws Exception
  /// @return array
  ///
  open func query(
    query: Any
  ) async throws -> Any {
    let path = "/graphql"

    let params: [String: Any?] = [
      "query": query,
    ]

    let headers: [String: String] = [
      "x-sdk-graphql": "true",
      "content-type": "application/json",
    ]

    let converter: (Any) -> Any = { response in
      response
    }

    return try await client.call(
      method: "POST",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// GraphQL Endpoint
  ///
  /// Execute a GraphQL mutation.
  ///
  /// @param Any query
  /// @throws Exception
  /// @return array
  ///
  open func mutation(
    query: Any
  ) async throws -> Any {
    let path = "/graphql/mutation"

    let params: [String: Any?] = [
      "query": query,
    ]

    let headers: [String: String] = [
      "x-sdk-graphql": "true",
      "content-type": "application/json",
    ]

    let converter: (Any) -> Any = { response in
      response
    }

    return try await client.call(
      method: "POST",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }
}
