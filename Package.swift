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
      url: "https://hvsdk.s3.amazonaws.com/ios/release/hypersnapsdk/6.10.0/HyperSnapSDK.xcframework.zip",
      checksum: "80587d4526a8a3fd1a304cbd9e2217de5805cd563532739404cdb034c26ab517"
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
