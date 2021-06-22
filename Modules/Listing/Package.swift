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
            targets: ["Listing"]),
    ],
    dependencies: [
        .package(name: "Altair-MDK", url: "https://github.com/mzapatae/AltairMDK-iOS.git", from: "0.9.0"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.1"),
        .package(name: "Favorites", path: "../Favorites"),
        .package(name: "Design", path: "../Design"),
        .package(name: "APIs", path: "../APIs"),
        .package(name: "Core", path: "../Core")
    ],
    targets: [
        .target(
            name: "Listing",
            dependencies: [
                "Altair-MDK",
                "Resolver",
                "Favorites",
                "Design",
                "APIs",
                "Core"
            ],
            path: "Sources")
    ]
)
