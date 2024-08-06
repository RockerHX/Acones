// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Acones",
     platforms: [
        .iOS(.v13),
     ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Acones",
            targets: ["Acones"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.17.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.12.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Acones"),
        .testTarget(
            name: "AconesTests",
            dependencies: ["Acones"]),
    ]
)
