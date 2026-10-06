// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CommonDomain", targets: ["CommonDomain"])
    ],
    targets: [
        .target(
            name: "CommonDomain",
            path: "Sources/Domain",
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)
