// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPlgr",
    products: [
        .executable(name: "swiftplgr", targets: ["SwiftPlgr"]),
        .library(name: "SwiftPlgr", type: .dynamic,targets: ["SwiftPlgrConv"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "./Antlr4", from: "4.0.0"),
        .package(url: "https://github.com/YusukeHosonuma/SwiftParamTest.git", from: "2.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftPlgr",
            dependencies: ["SwiftPlgrConv"]),
        .target(
            name: "SwiftPlgrConv",
            dependencies: ["Antlr4"]),
        .testTarget(
            name: "SwiftPlgrTests",
            dependencies: ["SwiftPlgr"]),
        .testTarget(
            name: "SwiftPlgrConvTests",
            dependencies: ["SwiftPlgrConv", "SwiftParamTest"]),
    ]
)
