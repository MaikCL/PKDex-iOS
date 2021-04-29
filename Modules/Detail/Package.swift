// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Detail",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Detail",
            type: .dynamic,
            targets: ["Detail"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Detail",
            dependencies: [],
            path: "Sources"),
    ]
)
