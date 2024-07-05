// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "steampec",
  platforms: [
    .macOS(.v13),
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      from: "1.2.0"
    ),
  ],
  targets: [
    .executableTarget(
      name: "steampec",
      dependencies: [
        .product(
          name: "ArgumentParser",
          package: "swift-argument-parser"
        ),
      ]
    ),
  ]
)
