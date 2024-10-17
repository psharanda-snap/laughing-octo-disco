
<div align="center">

![camerakit_icon](https://github.com/user-attachments/assets/d16b846d-0b4f-48da-bc18-6a40ddc3cb26)

# Camera Kit for iOS

[Home Page](https://developers.snap.com/camera-kit/home) | [Documentation & Guides](https://developers.snap.com/camera-kit/getting-started/what-is-camera-kit) | [Showcase](https://ar.snap.com/camera-kit) | [API Reference](https://kit.snapchat.com/reference/CameraKit/ios/1.34.0/index.html) | [Developer Portal](https://kit.snapchat.com/manage) | [My Lenses](https://my-lenses.snapchat.com/) | [Discord](https://discord.gg/snapar)
</div>

Camera Kit brings the power of Snap's AR platform to your websites and mobile apps on iOS and Android. It has never been easier to create and deliver scalable, multi-platform AR experiences to meet your customers, wherever they are.

## Features

### AR Capabilities
- Body Tracking
- Face Effects
- World Tracking
- Background Segmentation
- Location AR
- and [many more](https://developers.snap.com/lens-studio/learning-lens-studio/overview/) 

### iOS SDK
- Simply attach AR input to `AVCaptureSession`
- Fetch and display your lenses
- Capture media
- Test your lenses in development using [PushToDevice](P2D.md)
- Leverage Reference UI modules to quickly build Camera Kit based experiences
- Supports iOS 13.0+

## Integration Steps
1. [Integrate](https://developers.snap.com/camera-kit/integrate-sdk/mobile/ios) Camera Kit into your iOS application
2. [Create](https://developers.snap.com/camera-kit/ar-content/build-lenses) AR experiences using [Lens Studio](https://ar.snap.com/lens-studio)
3. [Manage](https://developers.snap.com/camera-kit/getting-started/setting-up-accounts) your Camera Kit applications using [Developer Portal](https://kit.snapchat.com/manage) and your AR experiences using [My Lenses](https://my-lenses.snapchat.com/) site

## Modules

A core module that handles AR experiences:
- `SCSDKCameraKit`

A set of open-sourced, reusable UI components and utilities for easier development of Camera Kit based experiences:
- `SCSDKCameraKitReferenceUI`
- `SCSDKCameraKitReferenceSwiftUI`

Modules required for [PushToDevice](P2D.md) support:
- `SCSDKCameraKitBaseExtension`
- `SCSDKCameraKitLoginKitAuth`
- `SCSDKCameraKitPushToDeviceExtension`

## Installation
### [Swift Package Manager](https://github.com/apple/swift-package-manager)
1. In Xcode, select "File" → "Swift Packages" → "Add Package Dependency"
2. Enter the repository URL: `https://github.com/Snapchat/camera-kit-ios-sdk.git`
3. Select the version and modules you want to use in your project

### [CocoaPods](https://cocoapods.org/)
If you use CocoaPods to manage your dependencies, simply add the following to your `Podfile`:
```ruby
pod 'SCCameraKit'
```

### Manual
1. Download the binaries from the [Releases](https://github.com/Snapchat/camera-kit-ios-sdk/releases) section
2. Unzip and add the Camera Kit SDK .xcframework to your Xcode project
3. In your target's "General" settings, add the framework to the "Frameworks, Libraries, and Embedded Content" section

## Usage
### Initializing Camera Kit
Obtain your API token on [Developer Portal](https://kit.snapchat.com/manage) beforehand

```swift
import SCSDKCameraKit

let sessionConfig = SessionConfig(apiToken: "<YOUR_API_TOKEN>")
let lensesConfig = LensesConfig(cacheConfig: CacheConfig(lensContentMaxSize: 1024*1024*1024))
        
let cameraKit = Session(sessionConfig: sessionConfig, lensesConfig: lensesConfig, errorHandler: self)
```

### Implementing Camera View
```swift
// Configure the camera preview view
let previewView = PreviewView()
previewView.automaticallyConfiguresTouchHandler = true
cameraKit.add(output: previewView)

// Configure the capture session
let captureSession = AVCaptureSession()
let sessionInput = AVSessionInput(session: captureSession)
let arInput = ARSessionInput()        
cameraKit.start(input: sessionInput, arInput: arInput)
sessionInput.startRunning()
```

### Applying AR Lens
You can find lens group IDs and specific lens IDs on [My Lenses](https://my-lenses.snapchat.com/) site
```swift
// Observe a particular lens
cameraKit.lenses.repository.addObserver(self, specificLensID: "<LENS_ID>", inGroupID: "<LENS_GROUP_ID>")

// Implement LensRepositorySpecificObserver to receive observed Lens object
extension MyViewController: LensRepositorySpecificObserver {
    func repository(_ repository: LensRepository, didUpdate lens: Lens, forGroupID groupID: String) {
        lensQueue.async { [weak self] in
            guard let self = self else { return }

            // Apply a lens, which makes it visible on previewView
            self.cameraKit.lenses.processor?.apply(lens: lens, launchData: nil) { success in
                if !success {
                    // Handle failure
                }
            }
        }
    }
    
    func repository(_ repository: LensRepository, didFailToUpdateLensID lensID: String, forGroupID groupID: String, error: Error?) {
        // Handle errors
    }
}
```

## Samples
We provide several sample apps that demonstrate different approaches to integrating the Camera Kit SDK:
- [CameraKitBasicSample](./Samples/CameraKitBasicSample) implements the bare minimum to show a single lens
- [CameraKitSample](./Samples/CameraKitSample) contains a fully functioning camera capture with lenses and preview flow
- [CameraKitAlternateCarouselSample](./Samples/CameraKitAlternateCarouselSample) demonstrates how to build your own carousel and preview screen

## License
Camera Kit for iOS is available under a custom license. See the [LICENSE](./LICENSE) file for more info.

## Contributing
We welcome contributions to the open-sourced parts of Camera Kit for iOS - Reference UI and Sample Apps. Feel free to open issues and submit PRs.

## Changelog
See [CHANGELOG.md](CHANGELOG.md) for details on each release.
