// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
	name: "combine-interception-macros",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.macCatalyst(.v13),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "CombineInterceptionMacros",
			type: .static,
			targets: ["CombineInterceptionMacros"]
		)
	],
	dependencies: [
		.package(
			url: "https://github.com/capturecontext/combine-interception.git",
			.upToNextMinor(from: "0.2.0")
		),
		.package(
			url: "https://github.com/capturecontext/swift-interception-macros.git",
			.upToNextMinor(from: "0.2.0")
		)
	],
	targets: [
		.target(
			name: "CombineInterceptionMacros",
			dependencies: [
				.product(name: "CombineInterception", package: "combine-interception"),
				.product(name: "_InterceptionMacrosDeclarations", package: "swift-interception-macros"),
			]
		),
	]
)
