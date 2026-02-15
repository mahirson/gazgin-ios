import SwiftUI

/// A view modifier that applies the Gazgin theme.
public struct GazginThemeModifier: ViewModifier {
    public init() {}

    public func body(content: Content) -> some View {
        content
            .font(GazginTypography.bodyLarge)
            .foregroundColor(GazginColors.onBackground)
    }
}

public extension View {
    func gazginTheme() -> some View {
        modifier(GazginThemeModifier())
    }
}
