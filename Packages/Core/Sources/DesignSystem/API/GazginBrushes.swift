import SwiftUI

// MARK: - Reusable Gradient Brushes

/// Reusable gradient definitions for the Gazgin design system.
///
/// Usage:
/// ```swift
/// Rectangle()
///     .fill(GazginBrushes.bottomScrim)
/// ```
public enum GazginBrushes {

    /// A bottom-darkening scrim gradient for overlaying on images so that
    /// white text remains readable. Fades from transparent at the top to
    /// 70 % black at the bottom.
    ///
    /// Matches the Figma linear-gradient:
    /// `linear-gradient(0deg, rgba(0,0,0,0.7) 25%, rgba(0,0,0,0) 70%)`
    public static let bottomScrim = LinearGradient(
        stops: [
            .init(color: .clear, location: 0.00),
            .init(color: .clear, location: 0.30),
            .init(color: .black.opacity(0.7), location: 0.75),
            .init(color: .black.opacity(0.7), location: 1.00)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
}
