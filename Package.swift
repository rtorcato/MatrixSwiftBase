// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MatrixSwiftBase",
    platforms: [.iOS(.v16), .macOS(.v10_14), .tvOS(.v16), .watchOS(.v9)],
//    exclude: ["instructions.md"],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MatrixSwiftBase",
            targets: ["MatrixSwiftBase"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/tbaranes/SwiftyUtils.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MatrixSwiftBase",
            dependencies: ["SwiftyUtils"],
            resources: [
                // .process("Swift-Base-Kit-Assets.xcassets")
                // .process("example.png"),
                // .copy("settings.plist")
            ]),
        .testTarget(
            name: "MatrixSwiftBaseTests",
            dependencies: ["MatrixSwiftBase", "SwiftyUtils"]),
    ]
)
