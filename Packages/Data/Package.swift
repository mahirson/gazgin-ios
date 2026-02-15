// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Entity", targets: ["Entity"]),
        .library(name: "Database", targets: ["Database"]),
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        // Entity
        .target(name: "Entity", dependencies: [
            .product(name: "Network", package: "Core"),
            .product(name: "DI", package: "Core"),
        ], path: "Sources/Entity"),

        // Database
        .target(name: "Database", dependencies: [
            .product(name: "DI", package: "Core"),
        ], path: "Sources/Database"),
    ]
)
