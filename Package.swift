// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Stencil",
    products: [
        .library(name: "Stencil", targets: ["Stencil"])
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.0"),
        .package(url: "https://github.com/kylef/Spectre.git", from: "0.9.0")
    ],
    targets: [
        .target(name: "Stencil", dependencies: [
            "PathKit"
        ], path: "Sources"),
        .testTarget(name: "StencilTests", dependencies: [
            "Stencil",
            "Spectre"
        ])
    ]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfig([
    "komondor": [
        "pre-push": "swift test",
        "pre-commit": [
            "swift test",
            "swift run swiftlint autocorrect --path Sources/",
            "git add .",
        ],
    ],
]).write()
#endif

