// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SCCameraKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
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
            path: "Frameworks/SCSDKCameraKit.xcframework"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitBaseExtension",
            path: "Frameworks/SCSDKCameraKitBaseExtension.xcframework"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitLoginKitAuth",
            path: "Frameworks/SCSDKCameraKitLoginKitAuth.xcframework"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitPushToDeviceExtension",
            path: "Frameworks/SCSDKCameraKitPushToDeviceExtension.xcframework"
        ),
        .target(name: "SCSDKCameraKitReferenceUI", dependencies: ["SCSDKCameraKit"], path: "Sources/SCSDKCameraKitReferenceUI"),
        .target(name: "SCSDKCameraKitReferenceSwiftUI", dependencies: ["SCSDKCameraKitReferenceUI"], path: "Sources/SCSDKCameraKitReferenceSwiftUI")
    ]
)
