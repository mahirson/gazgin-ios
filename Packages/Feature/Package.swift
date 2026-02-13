// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "HomeAPI", targets: ["HomeAPI"]),
        .library(name: "HomeImpl", targets: ["HomeImpl"]),
        .library(name: "ProfileAPI", targets: ["ProfileAPI"]),
        .library(name: "ProfileImpl", targets: ["ProfileImpl"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Domain"),
    ],
    targets: [
        // Home
        .target(name: "HomeAPI"),
        .target(name: "HomeImpl", dependencies: [
            "HomeAPI",
            .product(name: "DesignSystemAPI", package: "Core"),
            .product(name: "DesignSystemImpl", package: "Core"),
            .product(name: "CommonAPI", package: "Core"),
            .product(name: "AnalyticsAPI", package: "Core"),
            .product(name: "DIAPI", package: "Core"),
            .product(name: "ReposAPI", package: "Domain"),
        ]),

        // Profile
        .target(name: "ProfileAPI"),
        .target(name: "ProfileImpl", dependencies: [
            "ProfileAPI",
            .product(name: "DesignSystemAPI", package: "Core"),
            .product(name: "DesignSystemImpl", package: "Core"),
            .product(name: "CommonAPI", package: "Core"),
            .product(name: "AnalyticsAPI", package: "Core"),
            .product(name: "DIAPI", package: "Core"),
            .product(name: "ReposAPI", package: "Domain"),
        ]),
    ]
)
