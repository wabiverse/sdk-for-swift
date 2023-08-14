// swift-tools-version:5.8

import PackageDescription

let package = Package(
  name: "AppwriteServer",
  platforms: [
    .macOS(.v13),
    .iOS(.v16),
    .tvOS(.v12),
    .watchOS(.v4),
  ],
  products: [
    .library(
      name: "AppwriteServer",
      targets: ["AppwriteServer", "AppwriteServerModels", "AppwriteServerJSON"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.18.0"),
    .package(url: "https://github.com/apple/swift-nio.git", from: "2.58.0"),
  ],
  targets: [
    .target(
      name: "AppwriteServer",
      dependencies: [
        .product(name: "AsyncHTTPClient", package: "async-http-client"),
        .product(name: "NIOWebSocket", package: "swift-nio"),
        "AppwriteServerModels",
        "AppwriteServerJSON",
      ]
    ),
    .target(
      name: "AppwriteServerModels",
      dependencies: [
        "AppwriteServerJSON",
      ]
    ),
    .target(
      name: "AppwriteServerJSON"
    ),
    .testTarget(
      name: "AppwriteServerTests",
      dependencies: [
        "AppwriteServer",
      ]
    ),
  ]
)
