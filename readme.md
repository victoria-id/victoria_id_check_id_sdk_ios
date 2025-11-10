# Victoria ID - ID check - SDK - Documentation - iOS

## Table of contents

1. [Victoria ID - ID check - SDK - Documentation - iOS](#victoria-id---id-check---sdk---documentation---ios)
   1. [Table of contents](#table-of-contents)
   2. [Introduction](#introduction)
   3. [Adding the SDK to your project](#adding-the-sdk-to-your-project)
      1. [Swift Package Manager (SPM)](#swift-package-manager-spm)
         1. [Installing via Xcode](#installing-via-xcode)
         2. [Installing via Package.swift](#installing-via-packageswift)
      2. [CocoaPods](#cocoapods)
   4. [Usage](#usage)


## Introduction

This SDK contains the ID check from Victoria ID. It can be embedded in your application, which we will refer to as the "host application".
The SDK is designed to launch an activity that walks the user through multiple steps of the ID check. After completion, the SDK will return metadata to the host application, indicating the success or failure of the operation.


## Adding the SDK to your project

### Swift Package Manager (SPM)

#### Installing via Xcode

1. Select `File` -> `Add Packages...` in the Xcode menu bar.
2. Search for Victoria ID Check SDK package using the following URL:

   ```
   https://github.com/victoria-id/victoria_id_check_id_sdk_ios
   ```
3. Click _Add Package_ to add the SDK to your Xcode project and confirm.

#### Installing via Package.swift

Add the following dependency to your `Package.swift` file:

```swift

.package(
    url: "https://github.com/victoria-id/victoria_id_check_id_sdk_ios.git",
    from: "1.11.0"
)

```

Then, make sure to add the SDK to the target that needs it:

```swift

.target(
    name: "Your application",
    dependencies: ["victoria_id_check_id_sdk_ios"]),

```

### CocoaPods

> **Note**: The SDK is distributed as an XCFramework, therefore **you are required to use CocoaPods 1.9.0 or newer**.

Add the following to your Podfile:

```ruby

# Victoria-ID - ID check - SDK dependencies - Start
pod 'victoria_id_check_id_sdk_ios', git:'https://github.com/victoria-id/victoria_id_check_id_sdk_ios.git'
pod 'TesseractOCRiOS', :git => 'https://github.com/victoria-id/Tesseract-OCR-iOS', :tag => 'v5.5'
# Victoria-ID - ID check - SDK dependencies - End

```

## Usage

First, import the SDK:
```swift
import victoria_id_check_id_sdk_ios
```

To start the SDK activity from the host application (your application), use the code below.
For your convenience, we merged the code and this part of the documentation together so your codebase can benefit from code comments.

```swift

Victoria_ID_Check_ID_SDK(
    isPresented: $blnSdk_Start,
    onCompletion: { result in

        // Prepare to process the result of the ID check SDK.
        switch result {

        case .success:
            print("ID check was successfully performed.")

        case .exception_api_url:
            print("The Victoria Connect API did not accept the API URL to be able to start the process.")

        case .exception_api_data:
            print("The Victoria Connect API did not accept the payload data to finish the process.")

        case .exception_generic:
            print("Generic exception")

        case .feature_not_found_camera:
            alerter.alert = Alert(title: Text("sdk_return_camera_not_found_text"))

        case .feature_not_found_nfc:
            print("The device does not have NFC capability")

        case .data_share_decline:
            print("User declined to share data")

        case .none:
            break

        }
    },

    /*
     Provide the API URL (with token).

     Your API is expected to call `GET screenee/:screenee_id/check/identity/travel_document/text_chip_certificate/token/`
      as described in the Victoria Connect API documentation at https://doc.api.victoria-id.com/#1f481ddb-3547-4c17-8ec4-e47dfd47fb71
      to get the temporary token required for the API to start the process.
    */
    api_uri: "https://api.victoria-id.com/screenee/:screenee_id/check/identity/travel_document/text_chip_certificate/?domain=example.victoria-id.com&token=<token>",

    // Set the initial theme colors of the UI.
    // These colors should match the colors as they are set in the Portal settings of the screening portal.
    // When the SDK reaches step 3 of the user flow, it has made contact with the portal and fetched updated colors.
    color_primary: Color(named: "color_primary"),       // The primary color used for call-to-action elements.
    color_secondary: Color(named: "color_secondary"),   // Reserved.
    color_tertiary: Color(named: "color_tertiary"),     // Reserved.

    font_color: Color(named: "font_color"),             // Reserved.
    background_color: Color(named: "background_color")  // Reserved.
)

```
