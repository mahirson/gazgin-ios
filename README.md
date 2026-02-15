# Gazgin iOS

Gazgin travel app for iOS, built with SwiftUI and multi-module architecture using Swift Package Manager.

## Tech Stack

- **Language:** Swift 6.1
- **UI:** SwiftUI
- **DI:** [Factory](https://github.com/hmlongco/Factory) 2.5.3
- **Build:** Xcode 26.2, SPM local packages

### Navigation
Navigation is decoupled using the `FeatureEntry` protocol and **Factory** DI.
- **Core Navigation**: `Core/Navigation` defines `FeatureEntry`.
- **Feature Implementation**: Features implement `FeatureEntry` and register themselves in the DI container.
- **App Module**: `GazginApp` injects `FeatureEntry` factories to construct the UI dynamically.

## Architecture

Multi-module architecture with **API/Impl folder separation** within each module. Each module is a single SPM target containing `API/` (protocols, interfaces) and `Impl/` (implementations) subdirectories.

```
Gazgin/                              ← Xcode app target
Packages/
├── Core/                            ← SPM package (7 targets)
│   └── Sources/
│       ├── Network/                 ← URLSession networking
│       │   ├── API/                 ← Protocols & models
│       │   └── Impl/               ← Implementations
│       ├── DesignSystem/            ← Color/font tokens, theme
│       ├── Common/                  ← Result, Logger
│       ├── Components/              ← Base view protocols
│       ├── DI/                      ← Factory DI setup
│       ├── Analytics/               ← Event tracking
│       └── Navigation/              ← FeatureEntry protocol
├── Data/                            ← SPM package (2 targets)
│   └── Sources/
│       ├── Entity/                  ← Codable models, services
│       └── Database/                ← SwiftData models
├── Domain/                          ← SPM package (2 targets)
│   └── Sources/
│       ├── Repos/                   ← Repository interfaces & impls
│       └── DTO/                     ← DTOs, mappers
└── Feature/                         ← SPM package (2 targets)
    └── Sources/
        ├── Home/                    ← Home feature
        └── Profile/                 ← Profile feature
```

### Dependency Flow

```
App → Feature → Domain → Data
                       → Core
```

## Code Quality

Uses [SwiftLint](https://github.com/realm/SwiftLint) with a relaxed `.swiftlint.yml` config.

A **pre-push git hook** runs `swiftlint --fix` automatically before every push:
- **On `dev` branch** — lints all Swift files
- **On feature branches** — lints only files changed compared to `dev`

## Build Logic & Architecture Rules

### Dependency Rules
- Modules keep API and implementation code separated via `API/` and `Impl/` subdirectories within the same target.
- Cross-module dependencies should only reference the module name (e.g., `import Network`, `import Common`).

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
