import Foundation

extension Steampec {
  func buildURL(
    appID: String,
    countryCode: String,
    languageCode: String
  ) throws -> URL {
    guard let url = URL(string: "https://store.steampowered.com/api/appdetails")?
      .appending(queryItems: [
        .init(name: "appids", value: appID),
        .init(name: "cc", value: countryCode),
        .init(name: "l", value: languageCode),
      ])
    else { throw SteampecError.invalidURL }

    return url
  }

  func fetch(from url: URL) async throws -> Data {
    let request = URLRequest(url: url)
    let (data, _) = try await URLSession.shared.data(for: request)

    return data
  }

  func stringify(json: Data, pretty shouldPrettyPrint: Bool) throws -> String {
    let jsonObject = try JSONSerialization.jsonObject(
      with: json,
      options: .fragmentsAllowed
    )

    let jsonWritingOptions = {
      var this: JSONSerialization.WritingOptions = [
        .fragmentsAllowed, .withoutEscapingSlashes
      ]

      if shouldPrettyPrint {
        this.insert(.prettyPrinted)
      }

      return this
    }()

    let jsonData = try JSONSerialization.data(
      withJSONObject: jsonObject,
      options: jsonWritingOptions
    )

    guard let jsonString = String(data: jsonData, encoding: .utf8)
    else { throw SteampecError.jsonStringifyFailed }

    return jsonString
  }

  func export(json: String, to path: String) throws {
    try json.write(
      to: .init(filePath: path),
      atomically: true,
      encoding: .utf8
    )
  }
}
