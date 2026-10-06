// swift-tools-version: 6.0
import PackageDescription

// Standalone feature: it depends on no other feature.
// AddEvent has no Requests or Data layer, as it doesn't fetch or store anything itself.
let swiftSettings: [SwiftSetting] = [.swiftLanguageMode(.v5)]

let package = Package(
    name: "AddEvent",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AddEventFeature", targets: ["AddEventFeature"]),
        .library(name: "AddEventFeatureAPI", targets: ["AddEventFeatureAPI"])
    ],
    dependencies: [
        .package(path: "../../Common/Domain"),
        .package(path: "../../Common/Navigation")
    ],
    targets: [
        // MARK: - Layers
        .target(
            name: "AddEventFeaturePresentation",
            dependencies: [
                "AddEventFeatureDomain",
                "AddEventFeatureAPI",
                .product(name: "CommonDomain", package: "Domain"),
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/Presentation",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "AddEventFeatureDomain",
            dependencies: [
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Sources/Domain",
            swiftSettings: swiftSettings
        ),

        // MARK: - API
        .target(
            name: "AddEventFeatureAPI",
            dependencies: [
                .product(name: "CommonDomain", package: "Domain"),
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/API",
            swiftSettings: swiftSettings
        ),

        // MARK: - Implementation
        .target(
            name: "AddEventFeature",
            dependencies: [
                "AddEventFeatureAPI",
                "AddEventFeaturePresentation",
                .product(name: "CommonNavigation", package: "Navigation")
            ],
            path: "Sources/AddEvent",
            swiftSettings: swiftSettings
        ),

        // MARK: - Tests
        .testTarget(
            name: "AddEventFeatureDomainTests",
            dependencies: [
                "AddEventFeatureDomain",
                .product(name: "CommonDomain", package: "Domain")
            ],
            path: "Tests/Domain",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "AddEventFeaturePresentationTests",
            dependencies: ["AddEventFeaturePresentation"],
            path: "Tests/Presentation",
            swiftSettings: swiftSettings
        )
    ]
)
