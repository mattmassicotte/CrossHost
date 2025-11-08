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
		.package(url: "https://github.com/swift-libp2p/swift-bases", from: "0.2.0"),
		.package(url: "https://github.com/apple/swift-crypto.git", from: "3.0.0"),
	],
	targets: [
		.target(
			name: "ActivityPub",
			dependencies: [
				"JSONLD",
			]
		),
		.target(
			name: "ATProto",
			dependencies: [
				.product(name: "BaseX", package: "swift-bases"),
			]
		),
		.target(
			name: "CrossHost",
			dependencies: [
				.product(name: "Hummingbird", package: "hummingbird"),
				"NodeInfo",
				"WebFinger",
				"ActivityPub",
				"ATProto",
				.product(name: "Crypto", package: "swift-crypto"),
			]
		),
		.testTarget(
			name: "CrossHostTests",
			dependencies: ["CrossHost"]
		)
	]
)
