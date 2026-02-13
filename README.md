# Gazgin iOS

Gazgin travel app for iOS, built with SwiftUI and multi-module architecture using Swift Package Manager.

## Tech Stack

- **Language:** Swift 6.1
- **UI:** SwiftUI
- **DI:** [Factory](https://github.com/hmlongco/Factory) 2.5.3
- **Build:** Xcode 26.2, SPM local packages

## Architecture

Multi-module architecture with **API/Impl target separation** per module. API targets expose protocols, Impl targets contain implementations.

```
Gazgin/                              ← Xcode app target
Packages/
├── Core/                            ← SPM package (12 targets)
│   ├── NetworkAPI     | NetworkImpl          ← URLSession networking
│   ├── DesignSystemAPI | DesignSystemImpl    ← Color/font tokens, theme
│   ├── CommonAPI      | CommonImpl          ← Result, Logger
│   ├── ComponentsAPI  | ComponentsImpl      ← Base view protocols
│   ├── DIAPI          | DIImpl              ← Factory DI setup
│   └── AnalyticsAPI   | AnalyticsImpl       ← Event tracking
├── Data/                            ← SPM package (4 targets)
│   ├── EntityAPI      | EntityImpl          ← Codable models, services
│   └── DatabaseAPI    | DatabaseImpl        ← SwiftData models
├── Domain/                          ← SPM package (4 targets)
│   ├── ReposAPI       | ReposImpl           ← Repository interfaces
│   └── DTOAPI         | DTOImpl             ← DTOs, mappers
└── Feature/                         ← SPM package (4 targets)
    ├── HomeAPI        | HomeImpl            ← Home feature
    └── ProfileAPI     | ProfileImpl         ← Profile feature
```

### Dependency Flow

```
App → Feature:Impl → Domain:API → Data:API
                   → Core:DesignSystemImpl
     Domain:Impl   → Data:API + Core:DIAPI
```

## Code Quality

Uses [SwiftLint](https://github.com/realm/SwiftLint) with a relaxed `.swiftlint.yml` config.

A **pre-push git hook** runs `swiftlint --fix` automatically before every push:
- **On `dev` branch** — lints all Swift files
- **On feature branches** — lints only files changed compared to `dev`
- **On feature branches** — lints only files changed compared to `dev`

## Build Logic & Architecture Rules

### Dependency Rules
- **Strict Implementation Isolation**: Implementation targets (`-Impl`) cannot depend on other implementation targets.
- Always depend on the `-API` target instead.
- **Enforcement**: A pre-push hook runs `scripts/check_dependencies.swift` to verify this rule. The push will be rejected if violations are found.

## Getting Started

```bash
# Clone the repo
git clone https://github.com/mahirson/gazgin-ios.git
cd gazgin-ios

# Install git hooks
sh scripts/install-hooks.sh

# Open in Xcode
open Gazgin.xcodeproj
```

## Requirements

- Xcode 26.2 or later
- iOS 17.0+
- [SwiftLint](https://github.com/realm/SwiftLint) (`brew install swiftlint`)
