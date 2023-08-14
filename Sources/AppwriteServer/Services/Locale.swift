import AppwriteServerJSON
import AppwriteServerModels
import AsyncHTTPClient
import Foundation
import NIO

/// The Locale service allows you to customize your app based on your users&#039; location.
open class Locale: Service {
  ///
  /// Get User Locale
  ///
  /// Get the current user location based on IP. Returns an object with user
  /// country code, country name, continent name, continent code, ip address and
  /// suggested currency. You can use the locale header to get the data in a
  /// supported language.
  ///
  /// ([IP Geolocation by DB-IP](https://db-ip.com))
  ///
  /// @throws Exception
  /// @return array
  ///
  open func get(
  ) async throws -> AppwriteServerModels.Locale {
    let path = "/locale"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.Locale = { response in
      AppwriteServerModels.Locale.from(map: response as! [String: Any])
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
  /// List Continents
  ///
  /// List of all continents. You can use the locale header to get the data in a
  /// supported language.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listContinents(
  ) async throws -> AppwriteServerModels.ContinentList {
    let path = "/locale/continents"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.ContinentList = { response in
      AppwriteServerModels.ContinentList.from(map: response as! [String: Any])
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
  /// List Countries
  ///
  /// List of all countries. You can use the locale header to get the data in a
  /// supported language.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listCountries(
  ) async throws -> AppwriteServerModels.CountryList {
    let path = "/locale/countries"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.CountryList = { response in
      AppwriteServerModels.CountryList.from(map: response as! [String: Any])
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
  /// List EU Countries
  ///
  /// List of all countries that are currently members of the EU. You can use the
  /// locale header to get the data in a supported language.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listCountriesEU(
  ) async throws -> AppwriteServerModels.CountryList {
    let path = "/locale/countries/eu"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.CountryList = { response in
      AppwriteServerModels.CountryList.from(map: response as! [String: Any])
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
  /// List Countries Phone Codes
  ///
  /// List of all countries phone codes. You can use the locale header to get the
  /// data in a supported language.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listCountriesPhones(
  ) async throws -> AppwriteServerModels.PhoneList {
    let path = "/locale/countries/phones"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.PhoneList = { response in
      AppwriteServerModels.PhoneList.from(map: response as! [String: Any])
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
  /// List Currencies
  ///
  /// List of all currencies, including currency symbol, name, plural, and
  /// decimal digits for all major and minor currencies. You can use the locale
  /// header to get the data in a supported language.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listCurrencies(
  ) async throws -> AppwriteServerModels.CurrencyList {
    let path = "/locale/currencies"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.CurrencyList = { response in
      AppwriteServerModels.CurrencyList.from(map: response as! [String: Any])
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
  /// List Languages
  ///
  /// List of all languages classified by ISO 639-1 including 2-letter code, name
  /// in English, and name in the respective language.
  ///
  /// @throws Exception
  /// @return array
  ///
  open func listLanguages(
  ) async throws -> AppwriteServerModels.LanguageList {
    let path = "/locale/languages"

    let params: [String: Any] = [:]

    let headers = [
      "content-type": "application/json",
    ]

    let converter: (Any) -> AppwriteServerModels.LanguageList = { response in
      AppwriteServerModels.LanguageList.from(map: response as! [String: Any])
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
