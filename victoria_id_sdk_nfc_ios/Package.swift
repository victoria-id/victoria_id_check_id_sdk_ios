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
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "victoria_id_sdk_nfc_ios"),
        .testTarget(
            name: "victoria_id_sdk_nfc_iosTests",
            dependencies: ["victoria_id_sdk_nfc_ios"]),
    ]
)
