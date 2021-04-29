// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Listing",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Listing",
            type: .dynamic,
            targets: ["Listing"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Listing",
            dependencies: [],
            path: "Sources")
    ]
)
