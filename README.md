# SDK Documentation

## Introduction
This SDK is designed to launch a view controller that walks the user through multiple ID-check steps. After completion, the SDK will return meta-data to the calling application, indicating the success or failure of the operation. No sensitive information will be returned directly by the SDK.

## Installation
### Add the SDK to your project
To integrate the SDK into your Swift project, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/victoria-id/victoria_id_sdk_check_nfc_ios.git", from: "1.5.0")
]
```
Then, make sure to add the SDK to the target that needs it:
```swift
.target(
    name: "YourApp",
    dependencies: ["Victoria_ID_Check_SDK"]),
```

## Usage
### Import SDK
Firstly import the SDK using following code:
```kotlin
import Victoria_ID_Check_SDK
```
### Start SDK
To launch the SDK view controller from your Swift application, use the following code. You can pass optional parameters like color settings and the API URI to retrieve data.
```swift
let sdkViewController = Victoria_ID_Check_SDK_View_Controller()
sdkViewController.primary_color = UIColor(named: "color_primary")
sdkViewController.color_secondary = UIColor(named: "color_secondary")
sdkViewController.api_uri = URL(string: "https://yourapi.com/data?token=your_token")

sdkViewController.onCompletion = { result in
    switch result {
    case .success(let meta_data):
        // Handle success and process the meta_data
        print("SDK completed with meta-data: \(meta_data)")
    case .failure:
        // Handle failure state
        print("SDK failed or was canceled")
    }
}

present(sdkViewController, animated: true, completion: nil)
```

- `primary_color`: Set the primary color of the SDK’s UI.
- `secondary_color`: Set the secondary color for accents.
- `api_uri`: Provide the API URL (with token) for data retrieval. If omitted, the SDK will display the QR-code scanner step, which can still be themed using the passed color values.
