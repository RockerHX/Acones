// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Acones",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Acones",
            targets: ["Acones"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.18.1"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.2.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Acones",
            dependencies: ["Kingfisher", "SwiftDraw"]
        ),
        .testTarget(
            name: "AconesTests",
            dependencies: ["Acones"]
        ),
    ]
)
