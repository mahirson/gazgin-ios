// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Network", targets: ["Network"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "Common", targets: ["Common"]),
        .library(name: "Components", targets: ["Components"]),
        .library(name: "DI", targets: ["DI"]),
        .library(name: "Analytics", targets: ["Analytics"]),
        .library(name: "Navigation", targets: ["Navigation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.4.0"),
    ],
    targets: [
        // Network
        .target(name: "Network", dependencies: ["DI", .product(name: "Factory", package: "Factory")], path: "Sources/Network"),

        // Design System
        .target(name: "DesignSystem", path: "Sources/DesignSystem"),

        // Common
        .target(name: "Common", dependencies: [.product(name: "Factory", package: "Factory")], path: "Sources/Common"),

        // Components
        .target(name: "Components", path: "Sources/Components"),

        // DI
        .target(name: "DI", dependencies: [.product(name: "Factory", package: "Factory"), "Navigation"], path: "Sources/DI"),

        // Analytics
        .target(name: "Analytics", dependencies: ["Common", .product(name: "Factory", package: "Factory")], path: "Sources/Analytics"),

        // Navigation
        .target(name: "Navigation", path: "Sources/Navigation"),
    ]
)
