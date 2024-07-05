import ArgumentParser
import Foundation

@main
struct Steampec: AsyncParsableCommand {
  @Argument(help: "The app id included in the Steam store page URL.")
  private var appID: String

  @Option(
    name: [.short, .customLong("country")],
    help: "The ISO 3166-1 alpha-2 country code."
  )
  private var countryCode: String = "us"

  @Option(
    name: [.short, .customLong("language")],
    help: "One of the list of supported languages on Steam."
  )
  private var languageCode: String = "english"

  @Option(
    name: [.short, .customLong("file")],
    help: "The full file path where the resulting file will be exported."
  )
  private var fileExportPath: String?

  @Flag(
    name: [.customShort("p"), .customLong("pretty")],
    help: "Make the resulting data more readable."
  )
  private var shouldPrettyPrint: Bool = false

  mutating func run() async throws {
    let url = try buildURL(
      appID: appID,
      countryCode: countryCode,
      languageCode: languageCode
    )
    let data = try await fetch(from: url)
    let jsonString = try stringify(json: data, pretty: shouldPrettyPrint)

    if let fileExportPath = self.fileExportPath {
      try export(json: jsonString, to: fileExportPath)
    }

    print(jsonString)
  }
}
