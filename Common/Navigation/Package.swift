// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Navigation",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CommonNavigation", targets: ["CommonNavigation"])
    ],
    targets: [
        .target(
            name: "CommonNavigation",
            path: "Sources/Navigation",
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)
