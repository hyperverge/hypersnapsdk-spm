// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "HyperSnapSDK",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "HyperSnapSDK", type: .static, targets: ["HyperSnapSDKWrapper"])
  ],
  targets: [
    .binaryTarget(
      name: "HyperSnapSDK",
      url: "https://hvsdk.s3.amazonaws.com/ios/release/hypersnapsdk/6.4.0/HyperSnapSDK.xcframework.zip",
      checksum: "def65ce7d2b4249a21645fd969be9a459e083a38ef8a0e82ec0f32b9f7630477"
    ),
    .target(
      name: "HyperSnapSDKResources",
      path: "Sources/HyperSnapSDKResources",
      resources: [
        .copy("HyperSnapPreview.storyboardc"),
        .process("Resources")
      ]
    ),
    .target(
      name: "HyperSnapSDKWrapper",
      dependencies: ["HyperSnapSDK", "HyperSnapSDKResources"],
      path: "Sources/HyperSnapSDKWrapper"
    )
  ]
)
