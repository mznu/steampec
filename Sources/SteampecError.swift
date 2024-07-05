import Foundation

enum SteampecError: LocalizedError {
  case invalidURL
  case jsonStringifyFailed
}

extension SteampecError {
  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "The URL is invalid."

    case .jsonStringifyFailed:
      return "Failed to stringify JSON."
    }
  }
}
