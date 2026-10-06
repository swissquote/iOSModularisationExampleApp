// swift-tools-version: 6.0
import PackageDescription

// Consumer feature: uses AddEvent, and EventDetails through the App package.
// It only depends on their APIs, never on their implementations.
let swiftSettings: [SwiftSetting] = [.swiftLanguageMode(.v5)]

let package = Package(
    name: "Details",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DetailsFeature", targets: ["DetailsFeature"]),
        .library(name: "DetailsFeatureAPI", targets: ["DetailsFeatureAPI"])
    ],
    dependencies: [
        .package(path: "../../Common/Domain"),
        .package(path: "../../Common/ModuleLoader"),
        .package(path: "../../Common/Navigation"),
        .package(path: "../AddEvent"),
        .package(path: "../App")
    ],
    targets: [
        // MARK: - Layers
        .target(
            name: "DetailsFeaturePresentation",
            dependencies: [
                "DetailsFeatureDomain",
                "DetailsFeatureData",
                "DetailsFeatureAPI",
                .product(name: "AddEventFeatureAPI", package: "AddEvent"),
                .product(name: "AppFeatureAPI", package: "App"),
                .product(name: "CommonDomain", package: "Domain"),
                .product(name: "CommonModuleLoader", package: "ModuleLoader"),
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/Presentation",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "DetailsFeatureDomain",
            dependencies: [
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Sources/Domain",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "DetailsFeatureData",
            dependencies: [
                "DetailsFeatureDomain",
                "DetailsFeatureRequests",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Sources/Data",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "DetailsFeatureRequests",
            path: "Sources/Requests",
            swiftSettings: swiftSettings
        ),

        // MARK: - API
        .target(
            name: "DetailsFeatureAPI",
            dependencies: [
                .product(name: "CommonDomain", package: "Domain"),
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/API",
            swiftSettings: swiftSettings
        ),

        // MARK: - Implementation
        .target(
            name: "DetailsFeature",
            dependencies: [
                "DetailsFeatureAPI",
                "DetailsFeaturePresentation",
                .product(name: "CommonDomain", package: "Domain"),
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/Details",
            swiftSettings: swiftSettings
        ),

        // MARK: - Tests
        .testTarget(
            name: "DetailsFeatureDomainTests",
            dependencies: [
                "DetailsFeatureDomain",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Tests/Domain",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "DetailsFeatureDataTests",
            dependencies: [
                "DetailsFeatureData",
                "DetailsFeatureRequests",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Tests/Data",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "DetailsFeaturePresentationTests",
            dependencies: [
                "DetailsFeaturePresentation",
                "DetailsFeatureDomain",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Tests/Presentation",
            swiftSettings: swiftSettings
        )
    ]
)
