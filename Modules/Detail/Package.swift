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
            targets: ["Detail"]),
    ],
    dependencies: [
        .package(name: "Altair-MDK", url: "https://github.com/mzapatae/AltairMDK-iOS.git", from: "0.9.0"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.1"),
        .package(name: "Core", path: "../Core")
    ],
    targets: [
        .target(
            name: "Detail",
            dependencies: [
                "Altair-MDK",
                "Resolver",
                "Core"
            ],
            path: "Sources"),
    ]
)
