// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "APIs",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "APIs",
            type: .dynamic,
            targets: ["APIs"]),
    ],
    dependencies: [
        .package(name: "Altair-MDK", url: "https://github.com/mzapatae/AltairMDK-iOS.git", from: "0.5.0"),
    ],
    targets: [
        .target(
            name: "APIs",
            dependencies: [
                "Altair-MDK",
            ],
            path: "Sources"),
    ]
)
