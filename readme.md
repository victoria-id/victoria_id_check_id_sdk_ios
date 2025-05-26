# Victoria ID - ID check - SDK - Documentation - iOS

## Table of contents

- [Victoria ID - ID check - SDK - Documentation - iOS](#victoria-id---id-check---sdk---documentation---ios)
  - [Table of contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Adding the SDK to your project](#adding-the-sdk-to-your-project)
    - [Swift Package Manager (SPM)](#swift-package-manager-spm)
      - [Installing via Xcode](#installing-via-xcode)
      - [Installing via Package.swift](#installing-via-packageswift)
    - [CocoaPods](#cocoapods)
  - [Usage](#usage)


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
    from: "1.6.0"
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
pod 'victoria_id_check_id_sdk_ios', git:'https://github.com/victoria-id/victoria_id_check_id_sdk_ios.git'
```

## Usage

To start the SDK activity from the host application (your application), use the code below.
For your convenience, we merged the code and this part of the documentation together so your codebase can benefit from code comments.

```swift

// Create a new view controller to launch the ID check SDK.
let vcID_Check_SDK = Victoria_ID_Check_ID_SDK_View_Controller()


// Set the initial theme colors of the UI.
// These colors should match the colors as they are set in the Portal settings of the screening portal.
// When the SDK reaches step 3 of the user flow, it has made contact with the portal and fetched updated colors.
vcID_Check_SDK.color_primary = UIColor(named: "color_primary")      // The primary color used for call-to-action elements.
vcID_Check_SDK.color_secondary = UIColor(named: "color_secondary")  // Reserved.


/*
 Provide the API URL (with token). If omitted, the SDK will display the QR code scanner step,
  requiring the user to scan the QR code from the portal on a desktop computer.

 Your API is expected to call `GET screenee/:screenee_id/check/identity/travel_document/text_chip_certificate/token/`
  as described in the Victoria Connect API documentation at https://doc.api.victoria-id.com/#1f481ddb-3547-4c17-8ec4-e47dfd47fb71
  to get the temporary token required for the API to start and finish the process.
*/
vcID_Check_SDK.api_uri = URL(string: "https://api.victoria-id.com/screenee/:screenee_id/check/identity/travel_document/text_chip_certificate/?domain=example.victoria-id.com&token=<token>")


// Prepare to process the result of the ID check SDK.
vcID_Check_SDK.onCompletion = { result in
    switch result {

        // The result can be..

        // // The first two codes do not apply to iOS as they relate to the Android version of the SDK.
        // case .feature_not_found_camera:
        //     print("The device does not have a camera needed to scan a QR code and/or ID document.")
        //
        // case .feature_not_found_nfc:
        //     print("The device does not have NFC capability.")

        case .exception_api_url:
            print("The Victoria Connect API did not accept the API URL to be able to start the process.")

        case .exception_api_data:
            print("The Victoria Connect API did not accept the data payload to finish the process.")

        case .exception_generic:
            print("Generic exception.")

        case .success(let strID_Data_JSON):
            print("ID check was successfully performed.")

            /*
             Although the SDK returns the ID data from the API call for your convenience,
              it could have been altered using a man-in-the-middle attack.
             Do not send this information to your own API. It is not authoritative.

             Your API is expected to fetch the information directly from the Victoria Connect API using call
              `GET group/:group_id/screening/:screening_id/screenee/:screenee_id/`.
            */
            // print(strID_Data_JSON)

    }
}


// Launch the main ID check SDK view controller.
present(vcID_Check_SDK, animated: true, completion: nil)

```
