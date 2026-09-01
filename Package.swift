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
      url: "https://hvsdk.s3.amazonaws.com/ios/release/hypersnapsdk/6.7.0/HyperSnapSDK.xcframework.zip",
      checksum: "eb779b4e7542c7a30298a50d9374354413d1388294f2b472a641d9bdc11d2a4e"
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
