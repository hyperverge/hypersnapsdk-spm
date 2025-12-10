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
    url: "https://hvsdk.s3.ap-south-1.amazonaws.com/ios/release/hypersnapsdk/6.0.0/HyperSnapSDK-6.0.0-XCFramework.zip",
    checksum: "4ade9202906155c635fbcc271a8c72f429d472430c4ab183a11d5b4d6f3b352b"
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
