// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "victoria_id_check_id_sdk_ios",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "victoria_id_check_id_sdk_ios",
            targets: ["victoria_id_check_id_sdk_ios"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AndyQ/NFCPassportReader.git", exact: "2.1.1")
    ],
    targets: [
        .target(
            name: "victoria_id_check_id_sdk_ios",
            dependencies: [
                "victoria_id_check_id_sdk_ios_binary",
                "NFCPassportReader"
            ]
        ),
        .binaryTarget(
            name: "victoria_id_check_id_sdk_ios_binary",
            path: "./Frameworks/victoria_id_check_id_sdk_ios.xcframework")
    ]
)
