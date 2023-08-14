import AppwriteServerJSON
import AppwriteServerModels
import AsyncHTTPClient
import Foundation
import NIO

/// The Account service allows you to authenticate and manage a user account.
open class Account: Service {
  ///
  /// Get Account
  ///
  /// Get currently logged in user data as JSON object.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func get<T>(
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
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
  /// Get Account
  ///
  /// Get currently logged in user data as JSON object.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func get(
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await get(
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Update Email
  ///
  /// Update currently logged in user account email address. After changing user
  /// address, the user confirmation status will get reset. A new confirmation
  /// email is not sent automatically however you can use the send confirmation
  /// email endpoint again to send the confirmation email. For security measures,
  /// user password is required to complete this request.
  /// This endpoint can also be used to convert an anonymous account to a normal
  /// one, by passing an email address and a new password.
  ///
  ///
  /// @param String email
  /// @param String password
  /// @throws Exception
  /// @return array
  ///
  open func updateEmail<T>(
    email: String,
    password: String,
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account/email"

    let params: [String: Any?] = [
      "email": email,
      "password": password,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Update Email
  ///
  /// Update currently logged in user account email address. After changing user
  /// address, the user confirmation status will get reset. A new confirmation
  /// email is not sent automatically however you can use the send confirmation
  /// email endpoint again to send the confirmation email. For security measures,
  /// user password is required to complete this request.
  /// This endpoint can also be used to convert an anonymous account to a normal
  /// one, by passing an email address and a new password.
  ///
  ///
  /// @param String email
  /// @param String password
  /// @throws Exception
  /// @return array
  ///
  open func updateEmail(
    email: String,
    password: String
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await updateEmail(
      email: email,
      password: password,
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// List Logs
  ///
  /// Get currently logged in user list of latest security activity logs. Each
  /// log returns user IP address, location and date and time of log.
  ///
  /// @param [String] queries
  /// @throws Exception
  /// @return array
  ///
  open func listLogs(
    queries: [String]? = nil
  ) async throws -> AppwriteServerModels.LogList {
    let path = "/account/logs"

    let params: [String: Any?] = [
      "queries": queries,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.LogList = { response in
      AppwriteServerModels.LogList.from(map: response as! [String: Any])
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
  /// Update Name
  ///
  /// Update currently logged in user account name.
  ///
  /// @param String name
  /// @throws Exception
  /// @return array
  ///
  open func updateName<T>(
    name: String,
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account/name"

    let params: [String: Any?] = [
      "name": name,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Update Name
  ///
  /// Update currently logged in user account name.
  ///
  /// @param String name
  /// @throws Exception
  /// @return array
  ///
  open func updateName(
    name: String
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await updateName(
      name: name,
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Update Password
  ///
  /// Update currently logged in user password. For validation, user is required
  /// to pass in the new password, and the old password. For users created with
  /// OAuth, Team Invites and Magic URL, oldPassword is optional.
  ///
  /// @param String password
  /// @param String oldPassword
  /// @throws Exception
  /// @return array
  ///
  open func updatePassword<T>(
    password: String,
    oldPassword: String? = nil,
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account/password"

    let params: [String: Any?] = [
      "password": password,
      "oldPassword": oldPassword,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Update Password
  ///
  /// Update currently logged in user password. For validation, user is required
  /// to pass in the new password, and the old password. For users created with
  /// OAuth, Team Invites and Magic URL, oldPassword is optional.
  ///
  /// @param String password
  /// @param String oldPassword
  /// @throws Exception
  /// @return array
  ///
  open func updatePassword(
    password: String,
    oldPassword: String? = nil
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await updatePassword(
      password: password,
      oldPassword: oldPassword,
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Update Phone
  ///
  /// Update the currently logged in user's phone number. After updating the
  /// phone number, the phone verification status will be reset. A confirmation
  /// SMS is not sent automatically, however you can use the [POST
  /// /account/verification/phone](/docs/client/account#accountCreatePhoneVerification)
  /// endpoint to send a confirmation SMS.
  ///
  /// @param String phone
  /// @param String password
  /// @throws Exception
  /// @return array
  ///
  open func updatePhone<T>(
    phone: String,
    password: String,
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account/phone"

    let params: [String: Any?] = [
      "phone": phone,
      "password": password,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Update Phone
  ///
  /// Update the currently logged in user's phone number. After updating the
  /// phone number, the phone verification status will be reset. A confirmation
  /// SMS is not sent automatically, however you can use the [POST
  /// /account/verification/phone](/docs/client/account#accountCreatePhoneVerification)
  /// endpoint to send a confirmation SMS.
  ///
  /// @param String phone
  /// @param String password
  /// @throws Exception
  /// @return array
  ///
  open func updatePhone(
    phone: String,
    password: String
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await updatePhone(
      phone: phone,
      password: password,
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Get Account Preferences
  ///
  /// Get currently logged in user preferences as a key-value object.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getPrefs<T>(
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.Preferences<T> {
    let path = "/account/prefs"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Preferences<T> = { response in
      AppwriteServerModels.Preferences.from(map: response as! [String: Any])
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
  /// Get Account Preferences
  ///
  /// Get currently logged in user preferences as a key-value object.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func getPrefs(
  ) async throws -> AppwriteServerModels.Preferences<[String: AnyCodable]> {
    return try await getPrefs(
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Update Preferences
  ///
  /// Update currently logged in user account preferences. The object you pass is
  /// stored as is, and replaces any previous value. The maximum allowed prefs
  /// size is 64kB and throws error if exceeded.
  ///
  /// @param Any prefs
  /// @throws Exception
  /// @return array
  ///
  open func updatePrefs<T>(
    prefs: Any,
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account/prefs"

    let params: [String: Any?] = [
      "prefs": prefs,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Update Preferences
  ///
  /// Update currently logged in user account preferences. The object you pass is
  /// stored as is, and replaces any previous value. The maximum allowed prefs
  /// size is 64kB and throws error if exceeded.
  ///
  /// @param Any prefs
  /// @throws Exception
  /// @return array
  ///
  open func updatePrefs(
    prefs: Any
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await updatePrefs(
      prefs: prefs,
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Create Password Recovery
  ///
  /// Sends the user an email with a temporary secret key for password reset.
  /// When the user clicks the confirmation link he is redirected back to your
  /// app password reset URL with the secret key and email address values
  /// attached to the URL query string. Use the query string params to submit a
  /// request to the [PUT
  /// /account/recovery](/docs/client/account#accountUpdateRecovery) endpoint to
  /// complete the process. The verification link sent to the user's email
  /// address is valid for 1 hour.
  ///
  /// @param String email
  /// @param String url
  /// @throws Exception
  /// @return array
  ///
  open func createRecovery(
    email: String,
    url: String
  ) async throws -> AppwriteServerModels.Token {
    let path = "/account/recovery"

    let params: [String: Any?] = [
      "email": email,
      "url": url,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Token = { response in
      AppwriteServerModels.Token.from(map: response as! [String: Any])
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
  /// Create Password Recovery (confirmation)
  ///
  /// Use this endpoint to complete the user account password reset. Both the
  /// **userId** and **secret** arguments will be passed as query parameters to
  /// the redirect URL you have provided when sending your request to the [POST
  /// /account/recovery](/docs/client/account#accountCreateRecovery) endpoint.
  ///
  /// Please note that in order to avoid a [Redirect
  /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
  /// the only valid redirect URLs are the ones from domains you have set when
  /// adding your platforms in the console interface.
  ///
  /// @param String userId
  /// @param String secret
  /// @param String password
  /// @param String passwordAgain
  /// @throws Exception
  /// @return array
  ///
  open func updateRecovery(
    userId: String,
    secret: String,
    password: String,
    passwordAgain: String
  ) async throws -> AppwriteServerModels.Token {
    let path = "/account/recovery"

    let params: [String: Any?] = [
      "userId": userId,
      "secret": secret,
      "password": password,
      "passwordAgain": passwordAgain,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Token = { response in
      AppwriteServerModels.Token.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PUT",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// List Sessions
  ///
  /// Get currently logged in user list of active sessions across different
  /// devices.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listSessions(
  ) async throws -> AppwriteServerModels.SessionList {
    let path = "/account/sessions"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.SessionList = { response in
      AppwriteServerModels.SessionList.from(map: response as! [String: Any])
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
  /// Delete Sessions
  ///
  /// Delete all sessions from the user account and remove any sessions cookies
  /// from the end client.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func deleteSessions(
  ) async throws -> Any {
    let path = "/account/sessions"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    return try await client.call(
      method: "DELETE",
      path: path,
      headers: headers,
      params: params
    )
  }

  ///
  /// Get Session
  ///
  /// Use this endpoint to get a logged in user's session using a Session ID.
  /// Inputting 'current' will return the current session being used.
  ///
  /// @param String sessionId
  /// @throws Exception
  /// @return array
  ///
  open func getSession(
    sessionId: String
  ) async throws -> AppwriteServerModels.Session {
    let path = "/account/sessions/{sessionId}"
      .replacingOccurrences(of: "{sessionId}", with: sessionId)

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Session = { response in
      AppwriteServerModels.Session.from(map: response as! [String: Any])
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
  /// Update OAuth Session (Refresh Tokens)
  ///
  /// Access tokens have limited lifespan and expire to mitigate security risks.
  /// If session was created using an OAuth provider, this route can be used to
  /// "refresh" the access token.
  ///
  /// @param String sessionId
  /// @throws Exception
  /// @return array
  ///
  open func updateSession(
    sessionId: String
  ) async throws -> AppwriteServerModels.Session {
    let path = "/account/sessions/{sessionId}"
      .replacingOccurrences(of: "{sessionId}", with: sessionId)

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Session = { response in
      AppwriteServerModels.Session.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Delete Session
  ///
  /// Use this endpoint to log out the currently logged in user from all their
  /// account sessions across all of their different devices. When using the
  /// Session ID argument, only the unique session ID provided is deleted.
  ///
  ///
  /// @param String sessionId
  /// @throws Exception
  /// @return array
  ///
  open func deleteSession(
    sessionId: String
  ) async throws -> Any {
    let path = "/account/sessions/{sessionId}"
      .replacingOccurrences(of: "{sessionId}", with: sessionId)

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    return try await client.call(
      method: "DELETE",
      path: path,
      headers: headers,
      params: params
    )
  }

  ///
  /// Update Status
  ///
  /// Block the currently logged in user account. Behind the scene, the user
  /// record is not deleted but permanently blocked from any access. To
  /// completely delete a user, use the Users API instead.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func updateStatus<T>(
    nestedType _: T.Type
  ) async throws -> AppwriteServerModels.User<T> {
    let path = "/account/status"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.User<T> = { response in
      AppwriteServerModels.User.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PATCH",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Update Status
  ///
  /// Block the currently logged in user account. Behind the scene, the user
  /// record is not deleted but permanently blocked from any access. To
  /// completely delete a user, use the Users API instead.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func updateStatus(
  ) async throws -> AppwriteServerModels.User<[String: AnyCodable]> {
    return try await updateStatus(
      nestedType: [String: AnyCodable].self
    )
  }

  ///
  /// Create Email Verification
  ///
  /// Use this endpoint to send a verification message to your user email address
  /// to confirm they are the valid owners of that address. Both the **userId**
  /// and **secret** arguments will be passed as query parameters to the URL you
  /// have provided to be attached to the verification email. The provided URL
  /// should redirect the user back to your app and allow you to complete the
  /// verification process by verifying both the **userId** and **secret**
  /// parameters. Learn more about how to [complete the verification
  /// process](/docs/client/account#accountUpdateEmailVerification). The
  /// verification link sent to the user's email address is valid for 7 days.
  ///
  /// Please note that in order to avoid a [Redirect
  /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md),
  /// the only valid redirect URLs are the ones from domains you have set when
  /// adding your platforms in the console interface.
  ///
  ///
  /// @param String url
  /// @throws Exception
  /// @return array
  ///
  open func createVerification(
    url: String
  ) async throws -> AppwriteServerModels.Token {
    let path = "/account/verification"

    let params: [String: Any?] = [
      "url": url,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Token = { response in
      AppwriteServerModels.Token.from(map: response as! [String: Any])
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
  /// Create Email Verification (confirmation)
  ///
  /// Use this endpoint to complete the user email verification process. Use both
  /// the **userId** and **secret** parameters that were attached to your app URL
  /// to verify the user email ownership. If confirmed this route will return a
  /// 200 status code.
  ///
  /// @param String userId
  /// @param String secret
  /// @throws Exception
  /// @return array
  ///
  open func updateVerification(
    userId: String,
    secret: String
  ) async throws -> AppwriteServerModels.Token {
    let path = "/account/verification"

    let params: [String: Any?] = [
      "userId": userId,
      "secret": secret,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Token = { response in
      AppwriteServerModels.Token.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PUT",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }

  ///
  /// Create Phone Verification
  ///
  /// Use this endpoint to send a verification SMS to the currently logged in
  /// user. This endpoint is meant for use after updating a user's phone number
  /// using the [accountUpdatePhone](/docs/client/account#accountUpdatePhone)
  /// endpoint. Learn more about how to [complete the verification
  /// process](/docs/client/account#accountUpdatePhoneVerification). The
  /// verification code sent to the user's phone number is valid for 15 minutes.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func createPhoneVerification(
  ) async throws -> AppwriteServerModels.Token {
    let path = "/account/verification/phone"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Token = { response in
      AppwriteServerModels.Token.from(map: response as! [String: Any])
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
  /// Create Phone Verification (confirmation)
  ///
  /// Use this endpoint to complete the user phone verification process. Use the
  /// **userId** and **secret** that were sent to your user's phone number to
  /// verify the user email ownership. If confirmed this route will return a 200
  /// status code.
  ///
  /// @param String userId
  /// @param String secret
  /// @throws Exception
  /// @return array
  ///
  open func updatePhoneVerification(
    userId: String,
    secret: String
  ) async throws -> AppwriteServerModels.Token {
    let path = "/account/verification/phone"

    let params: [String: Any?] = [
      "userId": userId,
      "secret": secret,
    ]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Token = { response in
      AppwriteServerModels.Token.from(map: response as! [String: Any])
    }

    return try await client.call(
      method: "PUT",
      path: path,
      headers: headers,
      params: params,
      converter: converter
    )
  }
}
