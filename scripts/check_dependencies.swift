#!/usr/bin/env swift

import Foundation

// Configuration
let fileManager = FileManager.default
let currentDirectoryPath = fileManager.currentDirectoryPath

// ANSI Colors
let red = "\u{001B}[0;31m"
let green = "\u{001B}[0;32m"
let reset = "\u{001B}[0;0m"
let yellow = "\u{001B}[0;33m"

print("🔍 Checking for dependency violations...")

// 1. Find all Package.swift files
func findPackageFiles(in directory: String) -> [String] {
    let packagesDir = URL(fileURLWithPath: directory).appendingPathComponent("Packages")
    guard let enumerator = fileManager.enumerator(at: packagesDir, includingPropertiesForKeys: nil) else {
        return []
    }
    
    var packagePaths: [String] = []
    for case let fileURL as URL in enumerator {
        if fileURL.lastPathComponent == "Package.swift" {
            packagePaths.append(fileURL.deletingLastPathComponent().path)
        }
    }
    return packagePaths
}

// 2. Data structures for JSON parsing
struct PackageDump: Decodable {
    let name: String
    let targets: [Target]
}

struct Target: Decodable {
    let name: String
    let type: String
    let dependencies: [Dependency]
}

struct Dependency: Decodable {
    let byName: [String?]?
    let product: [String?]?
    // There can be other types like 'target', but 'byName' and 'product' are most common
    
    var name: String? {
        if let name = byName?.first, let n = name { return n }
        if let name = product?.first, let n = name { return n }
        return nil
    }
}

// 3. Process each package
let packageDirs = findPackageFiles(in: currentDirectoryPath)
var hasViolations = false

for dir in packageDirs {
    let packageName = URL(fileURLWithPath: dir).lastPathComponent
    // print("  - Analyzing package: \(packageName)")
    
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/swift")
    process.arguments = ["package", "dump-package"]
    process.currentDirectoryURL = URL(fileURLWithPath: dir)
    
    let pipe = Pipe()
    process.standardOutput = pipe
    // specific to swift package dump-package, it sometimes prints to stderr as well or instead
    // checking logic usually relies on stdout for JSON
    
    do {
        try process.run()
        process.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        
        let decoder = JSONDecoder()
        let package = try decoder.decode(PackageDump.self, from: data)
        
        for target in package.targets {
            if target.name.hasSuffix("Impl") {
                for dep in target.dependencies {
                    if let depName = dep.name, depName.hasSuffix("Impl") {
                        print("\(red)❌ Violation in \(packageName): Target '\(target.name)' depends on implementation module '\(depName)'.\(reset)")
                        print("\(yellow)   -> Depend on '\(depName.replacingOccurrences(of: "Impl", with: "API"))' instead.\(reset)")
                        hasViolations = true
                    }
                }
            }
        }
        
    } catch {
        print("\(red)Error analyzing package at \(dir): \(error)\(reset)")
    }
}

if hasViolations {
    print("\n\(red)💥 Dependency check failed. Please fix the violations listed above.\(reset)")
    exit(1)
} else {
    print("\n\(green)✅ Dependency check passed. No implementation modules depend on other implementation modules.\(reset)")
    exit(0)
}
