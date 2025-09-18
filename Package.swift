// swift-tools-version: 6.0
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
        .package(url: "https://github.com/victoria-id/Tesseract-OCR-iOS.git", branch: "v5.5"),
        .package(
            url: "https://github.com/iProov/ios-spm.git",
            .upToNextMajor(from: "12.4.1")
        ),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", exact: "1.1.2301")
    ],
    targets: [
        .target(
            name: "victoria_id_check_id_sdk_ios_targets",
            dependencies: [
                "victoria_id_check_id_sdk_ios",
                "OpenSSL",
                .product(name: "TesseractOCR", package: "Tesseract-OCR-iOS"),
                .product(name: "iProov", package: "ios-spm"),
            ]
        ),
        .binaryTarget(
            name: "victoria_id_check_id_sdk_ios",
            path: "Frameworks/victoria_id_check_id_sdk_ios.xcframework")
    ]
)
