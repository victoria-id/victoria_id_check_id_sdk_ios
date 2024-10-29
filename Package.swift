// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "victoria_id_sdk_nfc_ios",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "victoria_id_sdk_nfc_ios",
            targets: ["victoria_id_sdk_nfc_ios"]),
    ],
    targets: [
        .binaryTarget(
            name: "SimpleSomething",
            url: "https://github.com/victoria-id/victoria_id_check_id_sdk_ios/releases/download/1.0.1/SimpleSomething.xcframework.zip",
            checksum: "43e2f815bc149409943a3911e93cfa6039e253fc37950e14b58db672662607f8")
    ]
)
