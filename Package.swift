// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "SocialServer",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "SocialServer", targets: ["SocialServer"])
	],
	dependencies: [
		.package(url: "https://github.com/mattmassicotte/NodeInfo", branch: "main"),
		.package(url: "https://github.com/mattmassicotte/WebFinger", branch: "main"),
	],
	targets: [
		.target(
			name: "SocialServer",
			dependencies: ["NodeInfo", "WebFinger"]
		),
		.testTarget(
			name: "SocialServerTests",
			dependencies: ["SocialServer"]
		)
	]
)
