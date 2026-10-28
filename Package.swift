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
      url: "https://hvsdk.s3.amazonaws.com/ios/release/hypersnapsdk/6.9.1/HyperSnapSDK.xcframework.zip",
      checksum: "ef6486dfb6872c57a4a04f7c6b7d224ffd02a1be1497b92f3264c490a9c88f3b"
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
