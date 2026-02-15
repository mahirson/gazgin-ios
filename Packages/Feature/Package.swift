// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Home", targets: ["Home"]),
        .library(name: "Profile", targets: ["Profile"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Domain"),
    ],
    targets: [
        // Home
        .target(name: "Home", dependencies: [
            .product(name: "DesignSystem", package: "Core"),
            .product(name: "Common", package: "Core"),
            .product(name: "Analytics", package: "Core"),
            .product(name: "DI", package: "Core"),
            .product(name: "Navigation", package: "Core"),
            .product(name: "Repos", package: "Domain"),
        ], path: "Sources/Home"),

        // Profile
        .target(name: "Profile", dependencies: [
            .product(name: "DesignSystem", package: "Core"),
            .product(name: "Common", package: "Core"),
            .product(name: "Analytics", package: "Core"),
            .product(name: "DI", package: "Core"),
            .product(name: "Navigation", package: "Core"),
            .product(name: "Repos", package: "Domain"),
        ], path: "Sources/Profile"),
    ]
)
