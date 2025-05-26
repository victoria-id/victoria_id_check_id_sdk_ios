// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "victoria_id_check_id_sdk_ios",
    products: [
        .library(
            name: "victoria_id_check_id_sdk_ios",
            targets: ["victoria_id_check_id_sdk_ios"]),
    ],
    targets: [
        .binaryTarget(
            name: "victoria_id_check_id_sdk_ios",
            path: "./Frameworks/victoria_id_check_id_sdk_ios.xcframework"),
    ]
)
