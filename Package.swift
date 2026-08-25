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
      url: "https://hvsdk.s3.amazonaws.com/ios/release/hypersnapsdk/6.6.1/HyperSnapSDK.xcframework.zip",
      checksum: "7588a7ae7dd89e84c4029de6ea7a3c0ed62db5144f51c5d5a78230c73ef26501"
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
