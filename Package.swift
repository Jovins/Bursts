// swift-tools-version:5.3
//
//  Bursts
//
//  Copyright (c) 2021-Present Jovins - https://github.com/jovins

import PackageDescription

let package = Package(
    name: "Bursts",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "Bursts", targets: ["Bursts"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Bursts", dependencies: [], path: "Sources", exclude: ["Info.plist"])
    ],
    swiftLanguageVersions: [.v5]
)
