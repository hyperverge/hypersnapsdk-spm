// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "HyperSnapSDK",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "HyperSnapSDK", type: .static, targets: ["HyperSnapSDKWrapper"])
  ],
  targets: [
    // Binary target
    .binaryTarget(
          name: "HyperSnapSDK",
          url: "https://hvsdk.s3.amazonaws.com/ios/release/hypersnapsdk/6.1.0/HyperSnapSDK.xcframework.zip",
          checksum: "96a39094b572dc36c64efd740d8135dc3ef61dc383a5a8cca418c288e4785824"

        ),
    // Resource-only SPM target (contains Sources/HyperSnapSDKResources/Resources)
    .target(
      name: "HyperSnapSDKResources",
      path: "Sources/HyperSnapSDKResources",
      resources: [
        .process("Resources")
      ]
    ),

    // Thin wrapper target that re-exports the binary and depends on resources
    .target(
      name: "HyperSnapSDKWrapper",
      dependencies: ["HyperSnapSDK", "HyperSnapSDKResources"],
      path: "Sources/HyperSnapSDKWrapper"
    )
  ]
)
