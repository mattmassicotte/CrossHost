// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "CrossHost",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "CrossHost", targets: ["CrossHost", "ActivityPub"])
	],
	dependencies: [
		.package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
		.package(url: "https://github.com/mattmassicotte/NodeInfo", branch: "main"),
		.package(url: "https://github.com/mattmassicotte/WebFinger", branch: "main"),
		.package(url: "https://github.com/mattmassicotte/JSONLD", branch: "main"),
	],
	targets: [
		.target(
			name: "ActivityPub",
			dependencies: [
				"JSONLD",
			]
		),
		.target(
			name: "CrossHost",
			dependencies: [
				.product(name: "Hummingbird", package: "hummingbird"),
				"NodeInfo",
				"WebFinger",
				"ActivityPub",
			]
		),
		.testTarget(
			name: "CrossHostTests",
			dependencies: ["CrossHost"]
		)
	]
)
