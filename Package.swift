// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDBCombine",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(name: "GRDBCombine", targets: ["GRDBCombine"]),
    ],
    dependencies: [
        .package(url: "https://github.com/groue/GRDB.swift.git", .upToNextMajor(from: "4.1.0")),
        .package(url: "https://github.com/cx-org/CombineX", .upToNextMinor(from: "0.1.0")),
        .package(url: "https://github.com/cx-community/CombineExpectations.git", from: "0.4.0")
    ],
    targets: [
        .target(
            name: "GRDBCombine",
            dependencies: ["GRDB", "CXShim"]),
        .testTarget(
            name: "GRDBCombineTests",
            dependencies: ["GRDBCombine", "GRDB", "CombineExpectations"])
    ],
    swiftLanguageVersions: [.v5]
)

enum CombineImplementation {
    
    case combine, combineX, openCombine
    
    static var `default`: CombineImplementation {
        #if canImport(Combine)
        return .combine
        #else
        return .openCombine
        #endif
    }
    
    init?(_ description: String) {
        let desc = description.lowercased().filter { $0.isLetter }
        switch desc {
        case "combine":     self = .combine
        case "combinex":    self = .combineX
        case "opencombine": self = .openCombine
        default:            return nil
        }
    }
}

import Foundation

let env = ProcessInfo.processInfo.environment
let implkey = "CX_COMBINE_IMPLEMENTATION"
let combineImpl = env[implkey].flatMap(CombineImplementation.init) ?? .default

if combineImpl == .combine {
    package.platforms = [
        .iOS("13.0"),
        .macOS("10.15"),
        .tvOS("13.0"),
        .watchOS("6.0"),
    ]
}
