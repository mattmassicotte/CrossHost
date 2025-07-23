// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "SocialServer",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "SocialServer", targets: ["SocialServer"])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.0"),
		.package(url: "https://github.com/mattmassicotte/NodeInfo", branch: "main"),
		.package(url: "https://github.com/mattmassicotte/WebFinger", branch: "main"),
	],
	targets: [
		.target(
			name: "SocialServer",
			dependencies: [
				.product(name: "HTTPTypes", package: "swift-http-types"),
				"NodeInfo",
				"WebFinger",
			]
		),
		.testTarget(
			name: "SocialServerTests",
			dependencies: ["SocialServer"]
		)
	]
)
