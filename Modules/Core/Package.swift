// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(name: "Altair-MDK", url: "https://github.com/mzapatae/AltairMDK-iOS.git", .branch("feature/basic-implementation")),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.1"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                "Altair-MDK",
                "Resolver"
            ],
            path: "Sources")
    ]
)
