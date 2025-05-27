// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "victoria_id_check_id_sdk_ios",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "victoria_id_check_id_sdk_ios",
            targets: ["victoria_id_check_id_sdk_ios_targets"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AndyQ/NFCPassportReader.git", exact: "2.1.1")
    ],
    targets: [
        .target(
            name: "victoria_id_check_id_sdk_ios_targets",
            dependencies: [
                "victoria_id_check_id_sdk_ios",
                "NFCPassportReader"
            ]
        ),
        .binaryTarget(
            name: "victoria_id_check_id_sdk_ios",
            url: "https://api.github.com/repos/victoria-id/victoria_id_check_id_sdk_ios/releases/assets/258541563.zip",
            checksum: "64cc6835913a6c06a707e21f16561a83f88e576560adc3f1f3b19c6c4762f9b4")
    ]
)
