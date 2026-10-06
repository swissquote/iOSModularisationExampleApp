// swift-tools-version: 6.0
import PackageDescription

// Consumer feature: uses Details through its API only.
let swiftSettings: [SwiftSetting] = [.swiftLanguageMode(.v5)]

let package = Package(
    name: "Home",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
        .library(name: "HomeFeatureAPI", targets: ["HomeFeatureAPI"])
    ],
    dependencies: [
        .package(path: "../../Common/Domain"),
        .package(path: "../../Common/ModuleLoader"),
        .package(path: "../../Common/Navigation"),
        .package(path: "../Details")
    ],
    targets: [
        // MARK: - Layers
        .target(
            name: "HomeFeaturePresentation",
            dependencies: [
                "HomeFeatureDomain",
                "HomeFeatureData",
                "HomeFeatureAPI",
                .product(name: "DetailsFeatureAPI", package: "Details"),
                .product(name: "CommonDomain", package: "Domain"),
                .product(name: "CommonModuleLoader", package: "ModuleLoader"),
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/Presentation",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "HomeFeatureDomain",
            dependencies: [
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Sources/Domain",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "HomeFeatureData",
            dependencies: [
                "HomeFeatureDomain",
                "HomeFeatureRequests",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Sources/Data",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "HomeFeatureRequests",
            path: "Sources/Requests",
            swiftSettings: swiftSettings
        ),

        // MARK: - API
        .target(
            name: "HomeFeatureAPI",
            dependencies: [
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/API",
            swiftSettings: swiftSettings
        ),

        // MARK: - Implementation
        .target(
            name: "HomeFeature",
            dependencies: [
                "HomeFeatureAPI",
                "HomeFeaturePresentation",
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/Home",
            swiftSettings: swiftSettings
        ),

        // MARK: - Tests
        .testTarget(
            name: "HomeFeatureDomainTests",
            dependencies: [
                "HomeFeatureDomain",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Tests/Domain",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "HomeFeatureDataTests",
            dependencies: [
                "HomeFeatureData",
                "HomeFeatureRequests"
            ],
            path: "Tests/Data",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "HomeFeaturePresentationTests",
            dependencies: [
                "HomeFeaturePresentation",
                "HomeFeatureDomain",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Tests/Presentation",
            swiftSettings: swiftSettings
        )
    ]
)
