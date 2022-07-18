// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ImageViewer_swift",
	platforms: [
		.iOS(.v10)
	],
    products: [
        .library(
            name: "ImageViewer_swift",
            targets: ["ImageViewer_swift"])
	],
	targets: [
		.target(
			name: "ImageViewer_swift",
			path: "Sources/ImageViewer_swift")
	]
)
