// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "EntityAPI", targets: ["EntityAPI"]),
        .library(name: "EntityImpl", targets: ["EntityImpl"]),
        .library(name: "DatabaseAPI", targets: ["DatabaseAPI"]),
        .library(name: "DatabaseImpl", targets: ["DatabaseImpl"]),
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        // Entity
        .target(name: "EntityAPI", dependencies: [
            .product(name: "NetworkAPI", package: "Core"),
        ]),
        .target(name: "EntityImpl", dependencies: [
            "EntityAPI",
            .product(name: "NetworkAPI", package: "Core"),
            .product(name: "DIAPI", package: "Core"),
        ]),

        // Database
        .target(name: "DatabaseAPI"),
        .target(name: "DatabaseImpl", dependencies: [
            "DatabaseAPI",
            .product(name: "DIAPI", package: "Core"),
        ]),
    ]
)
