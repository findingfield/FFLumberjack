// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FFLumberjack",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FFLumberjack",
            targets: ["FFLumberjack"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.5")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FFLumberjack",
            dependencies: [
                .productItem(
                    name: "CocoaLumberjackSwift",
                    package: "CocoaLumberjack",
                    moduleAliases: nil,
                    condition: .none
                )
            ],
            path: "FFLumberjack"
        ),
        .testTarget(
            name: "FFLumberjackTests",
            dependencies: ["FFLumberjack"]
        ),
    ]
)
