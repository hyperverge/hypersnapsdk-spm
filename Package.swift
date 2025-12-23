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
    checksum: "6bcfcd103100a46a5e1de314d70c6d3eaeb64de9ce89883ff88caf3866d9df13"
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
