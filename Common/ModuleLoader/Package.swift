// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ModuleLoader",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "CommonModuleLoader", targets: ["CommonModuleLoader"])
    ],
    targets: [
        .target(
            name: "CommonModuleLoader",
            path: "Sources/ModuleLoader",
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)
