// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PugiSwiftComparisons",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/elihwyma/PugiSwift.git", branch: "main"),
        .package(url: "https://github.com/CoreOffice/XMLCoder.git", from: "0.17.0"),
        .package(url: "https://github.com/cezheng/Fuzi.git", from: "3.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "PugiSwiftComparisons",
            dependencies: [
                .product(name: "PugiSwift", package: "PugiSwift"),
                .product(name: "Fuzi", package: "Fuzi"),
                .product(name: "XMLCoder", package: "XMLCoder")
            ],
            swiftSettings: [
                .interoperabilityMode(.Cxx),
                .swiftLanguageMode(.v6),
                .unsafeFlags([
                    "-Xcc", "-std=c++20"
                ])
            ]
        ),
    ]
)
