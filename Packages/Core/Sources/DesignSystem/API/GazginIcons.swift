import SwiftUI

// MARK: - GazginIcons

/// Reusable icons for the design system.
/// Access via `GazginTheme.icons` from any SwiftUI view.
public struct GazginIcons: Sendable {
    public let search: Image
    public let close: Image
}

// MARK: - Default Factory

public let gazginIcons = GazginIcons(
    search: Image(systemName: "magnifyingglass"),
    close: Image(systemName: "xmark")
)
