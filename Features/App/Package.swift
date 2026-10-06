// swift-tools-version: 6.0
import PackageDescription

/// API-only package. The app target implements these protocols for screens
/// that still live in the monolith, until their owners move them into a module.
let package = Package(
    name: "App",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppFeatureAPI", targets: ["AppFeatureAPI"])
    ],
    dependencies: [
        .package(path: "../../Common/Domain")
    ],
    targets: [
        .target(
            name: "AppFeatureAPI",
            dependencies: [
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Sources/API",
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)
