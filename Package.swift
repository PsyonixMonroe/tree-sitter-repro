// swift-tools-version:5.3

import Foundation
import PackageDescription

var sources = ["src/parser.c"]
if FileManager.default.fileExists(atPath: "src/scanner.c") {
    sources.append("src/scanner.c")
}

let package = Package(
    name: "TreeSitterRepro",
    products: [
        .library(name: "TreeSitterRepro", targets: ["TreeSitterRepro"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterRepro",
            dependencies: [],
            path: ".",
            sources: sources,
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterReproTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterRepro",
            ],
            path: "bindings/swift/TreeSitterReproTests"
        )
    ],
    cLanguageStandard: .c11
)
