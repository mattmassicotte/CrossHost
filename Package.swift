// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "SocialServer",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "SocialServer", targets: ["SocialServer"])
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "SocialServer",
			dependencies: []
		),
		.testTarget(
			name: "SocialServerTests",
			dependencies: ["SocialServer"]
		)
	]
)
