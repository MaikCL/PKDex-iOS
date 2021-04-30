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
            targets: ["APIs"]),
    ],
    dependencies: [
        .package(name: "Altair-MDK", url: "https://github.com/mzapatae/AltairMDK-iOS.git", .branch("feature/basic-implementation")),
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
