// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ReposAPI", targets: ["ReposAPI"]),
        .library(name: "ReposImpl", targets: ["ReposImpl"]),
        .library(name: "DTOAPI", targets: ["DTOAPI"]),
        .library(name: "DTOImpl", targets: ["DTOImpl"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Data"),
    ],
    targets: [
        // Repos
        .target(name: "ReposAPI", dependencies: [
            .product(name: "CommonAPI", package: "Core"),
        ]),
        .target(name: "ReposImpl", dependencies: [
            "ReposAPI",
            "DTOAPI",
            .product(name: "EntityAPI", package: "Data"),
            .product(name: "DatabaseAPI", package: "Data"),
            .product(name: "CommonAPI", package: "Core"),
            .product(name: "DIAPI", package: "Core"),
        ]),

        // DTO
        .target(name: "DTOAPI"),
        .target(name: "DTOImpl", dependencies: ["DTOAPI"]),
    ]
)
