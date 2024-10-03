// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Resistance",
    products: [
        .library(
            name: "Resistance",
            targets: ["Resistance"]),
    ],
    targets: [
        .target(
            name: "Resistance",
            dependencies: []),
        .testTarget(
            name: "ResistanceTests",
            dependencies: ["Resistance"]),
    ]
)
