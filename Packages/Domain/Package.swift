// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Repos", targets: ["Repos"]),
        .library(name: "DTO", targets: ["DTO"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Data"),
    ],
    targets: [
        // Repos
        .target(name: "Repos", dependencies: [
            "DTO",
            .product(name: "Entity", package: "Data"),
            .product(name: "Database", package: "Data"),
            .product(name: "Common", package: "Core"),
            .product(name: "DI", package: "Core"),
        ], path: "Sources/Repos"),

        // DTO
        .target(name: "DTO", path: "Sources/DTO"),
    ]
)
