// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SCCameraKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "SCSDKCameraKit", targets: ["SCSDKCameraKit"]),
        .library(name: "SCSDKCameraKitBaseExtension", targets: ["SCSDKCameraKitBaseExtension"]),
        .library(name: "SCSDKCameraKitLoginKitAuth", targets: ["SCSDKCameraKitLoginKitAuth"]),
        .library(name: "SCSDKCameraKitPushToDeviceExtension", targets: ["SCSDKCameraKitPushToDeviceExtension"]),
        .library(name: "SCSDKCameraKitReferenceUI", targets: ["SCSDKCameraKitReferenceUI"]),
        .library(name: "SCSDKCameraKitReferenceSwiftUI", targets: ["SCSDKCameraKitReferenceSwiftUI"]),
        
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SCSDKCameraKit",
            url: "https://github.com/psharanda-snap/laughing-octo-disco/releases/download/hosting-1.34.0/SCSDKCameraKit.xcframework.zip",
            checksum: "908986ed5f466439ac912fd3defbab4ec52fc7d9f7d37cc3b80ccba2fdc68aa1"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitBaseExtension",
            url: "https://github.com/psharanda-snap/laughing-octo-disco/releases/download/hosting-1.34.0/SCSDKCameraKitBaseExtension.xcframework.zip",
            checksum: "2423763c30d2a7e617fcbbc4f4c75179195d89d28da9f5de41072147f305db9b"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitLoginKitAuth",
            url: "https://github.com/psharanda-snap/laughing-octo-disco/releases/download/hosting-1.34.0/SCSDKCameraKitLoginKitAuth.xcframework.zip",
            checksum: "e9c02579d9581f150ca4f00bfab6aa4baaf00a344ff956a5f41c69cb3d70aba7"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitPushToDeviceExtension",
            url: "https://github.com/psharanda-snap/laughing-octo-disco/releases/download/hosting-1.34.0/SCSDKCameraKitPushToDeviceExtension.xcframework.zip",
            checksum: "2c69c39cf26d25aaebfdecfbbab35a246288e9846dad1b0ba8e374719a008b74"
        ),
        .target(name: "SCSDKCameraKitReferenceUI", dependencies: ["SCSDKCameraKit"], path: "Sources/SCSDKCameraKitReferenceUI"),
        .target(name: "SCSDKCameraKitReferenceSwiftUI", dependencies: ["SCSDKCameraKitReferenceUI"], path: "Sources/SCSDKCameraKitReferenceSwiftUI")
    ]
)
