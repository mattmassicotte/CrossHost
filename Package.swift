// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "CrossHost",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "CrossHost", targets: ["CrossHost"])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.0"),
		.package(url: "https://github.com/mattmassicotte/NodeInfo", branch: "main"),
		.package(url: "https://github.com/mattmassicotte/WebFinger", branch: "main"),
	],
	targets: [
		.target(
			name: "CrossHost",
			dependencies: [
				.product(name: "HTTPTypes", package: "swift-http-types"),
				"NodeInfo",
				"WebFinger",
			]
		),
		.testTarget(
			name: "CrossHostTests",
			dependencies: ["CrossHost"]
		)
	]
)
