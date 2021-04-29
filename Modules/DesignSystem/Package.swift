// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DesignSystem",
            type: .dynamic,
            targets: ["DesignSystem"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [],
            path: "Sources")
    ]
)
