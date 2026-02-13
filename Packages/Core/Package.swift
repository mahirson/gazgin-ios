// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "NetworkAPI", targets: ["NetworkAPI"]),
        .library(name: "NetworkImpl", targets: ["NetworkImpl"]),
        .library(name: "DesignSystemAPI", targets: ["DesignSystemAPI"]),
        .library(name: "DesignSystemImpl", targets: ["DesignSystemImpl"]),
        .library(name: "CommonAPI", targets: ["CommonAPI"]),
        .library(name: "CommonImpl", targets: ["CommonImpl"]),
        .library(name: "ComponentsAPI", targets: ["ComponentsAPI"]),
        .library(name: "ComponentsImpl", targets: ["ComponentsImpl"]),
        .library(name: "DIAPI", targets: ["DIAPI"]),
        .library(name: "DIImpl", targets: ["DIImpl"]),
        .library(name: "AnalyticsAPI", targets: ["AnalyticsAPI"]),
        .library(name: "AnalyticsImpl", targets: ["AnalyticsImpl"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.4.0"),
    ],
    targets: [
        // Network
        .target(name: "NetworkAPI"),
        .target(name: "NetworkImpl", dependencies: ["NetworkAPI", "DIAPI", .product(name: "Factory", package: "Factory")]),

        // Design System
        .target(name: "DesignSystemAPI"),
        .target(name: "DesignSystemImpl", dependencies: ["DesignSystemAPI"]),

        // Common
        .target(name: "CommonAPI"),
        .target(name: "CommonImpl", dependencies: ["CommonAPI", .product(name: "Factory", package: "Factory")]),

        // Components
        .target(name: "ComponentsAPI"),
        .target(name: "ComponentsImpl", dependencies: ["ComponentsAPI"]),

        // DI
        .target(name: "DIAPI", dependencies: [.product(name: "Factory", package: "Factory")]),
        .target(name: "DIImpl", dependencies: ["DIAPI", .product(name: "Factory", package: "Factory")]),

        // Analytics
        .target(name: "AnalyticsAPI"),
        .target(name: "AnalyticsImpl", dependencies: ["AnalyticsAPI", "CommonAPI", "CommonImpl", .product(name: "Factory", package: "Factory")]),
    ]
)
