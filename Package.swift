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
            url: "https://api.github.com/repos/victoria-id/victoria_id_check_id_sdk_ios/releases/assets/258523650.zip",
            checksum: "a6a1580ae69affe27388135b8d666bc8d2a58333cd046de1aa418bf2b74bfb94")
    ]
)
