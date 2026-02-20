import SwiftUI

// MARK: - GazginTheme Accessor

/// Central theme accessor. Use in any SwiftUI view:
///
/// ```swift
/// GazginTheme.colors(for: colorScheme).primary.base
/// GazginTheme.typeface.display.regular
/// ```
///
/// Or via the environment-aware view modifier:
///
/// ```swift
/// Text("Hello")
///     .gazginTheme()
/// ```
public enum GazginTheme {

    /// Returns the color scheme for the given appearance.
    public static func colors(for scheme: ColorScheme) -> GazginColorScheme {
        scheme == .dark ? darkGazginColors : lightGazginColors
    }

    /// Returns the button styles hierarchy for the given appearance.
    public static func styles(for scheme: ColorScheme) -> GazginStyles {
        gazginStyles(for: colors(for: scheme), isDark: scheme == .dark)
    }

    /// Typography is the same for light and dark modes.
    public static let typeface: GazginTypographyScheme = gazginTypography

    /// Dimension tokens are the same for light and dark modes.
    public static let dimens: GazginDimensions = gazginDimensions

    /// Reusable icons mapped to system symbols.
    public static let icons: GazginIcons = gazginIcons()
}

// MARK: - Environment Key

private struct GazginColorsKey: EnvironmentKey {
    static let defaultValue: GazginColorScheme = lightGazginColors
}

private struct GazginStylesKey: EnvironmentKey {
    static let defaultValue: GazginStyles = gazginStyles(for: lightGazginColors, isDark: false)
}

public extension EnvironmentValues {
    var gazginColors: GazginColorScheme {
        get { self[GazginColorsKey.self] }
        set { self[GazginColorsKey.self] = newValue }
    }
    var gazginStyles: GazginStyles {
        get { self[GazginStylesKey.self] }
        set { self[GazginStylesKey.self] = newValue }
    }
}

// MARK: - View Modifier

/// Applies the Gazgin theme with automatic dark/light mode support.
///
/// Usage:
/// ```swift
/// ContentView()
///     .gazginTheme()
/// ```
///
/// Access colors inside any child view:
/// ```swift
/// @Environment(\.gazginColors) var colors
/// // colors.primary.base, colors.alert.error.base, etc.
/// ```
public struct GazginThemeModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    public init() {}

    public func body(content: Content) -> some View {
        let colors = GazginTheme.colors(for: colorScheme)
        let styles = GazginTheme.styles(for: colorScheme)
        content
            .environment(\.gazginColors, colors)
            .environment(\.gazginStyles, styles)
            .font(GazginTheme.typeface.body.regular)
            .foregroundColor(colors.onBackground)
    }
}

public extension View {
    func gazginTheme() -> some View {
        modifier(GazginThemeModifier())
    }
}
