// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "victoria_id_check_id_sdk_ios",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "victoria_id_check_id_sdk_ios",
            targets: ["victoria_id_check_id_sdk_ios"]),
    ],
    targets: [
        .binaryTarget(
            name: "victoria_id_check_id_sdk_ios",
            path: "./Frameworks/victoria_id_check_id_sdk_ios.xcframework"),
            //url: "https://api.github.com/repos/victoria-id/victoria_id_check_id_sdk_ios/releases/assets/185844235.zip",
            //checksum: "ab25f4b050ff3b51ef19dd401f130713964908acb4588890744fd3930ab7255a")
    ]
)
