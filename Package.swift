// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "CameraKit",
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
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.36.0/SCSDKCameraKit.xcframework.zip",
            checksum: "6a683a9abe7d1a5b8432e2b7a27e08fdd3091ad1d045de269730538f47ef4cbe"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitBaseExtension",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.36.0/SCSDKCameraKitBaseExtension.xcframework.zip",
            checksum: "62a0b99539d0e6e90ba209aaf575546a010f9815810c4ba6448d44c110ce7e1d"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitLoginKitAuth",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.36.0/SCSDKCameraKitLoginKitAuth.xcframework.zip",
            checksum: "1e5a5360e9701a7aa0659da25948f531680cd49ba84614b016243cbea583664d"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitPushToDeviceExtension",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.36.0/SCSDKCameraKitPushToDeviceExtension.xcframework.zip",
            checksum: "9153be8c7d06bc5059dcbecd5229deebb3dae338a96b5cf34248b35d79446e5d"
        ),
        .target(name: "SCSDKCameraKitReferenceUI", dependencies: ["SCSDKCameraKit"], path: "Sources/SCSDKCameraKitReferenceUI"),
        .target(name: "SCSDKCameraKitReferenceSwiftUI", dependencies: ["SCSDKCameraKitReferenceUI"], path: "Sources/SCSDKCameraKitReferenceSwiftUI")
    ]
)
