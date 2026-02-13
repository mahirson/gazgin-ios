import SwiftUI

/// Gazgin color tokens.
public enum GazginColors {
    public static let primary = Color(red: 0.0, green: 0.48, blue: 1.0)
    public static let secondary = Color(red: 0.35, green: 0.34, blue: 0.84)
    public static let background = Color(red: 0.95, green: 0.95, blue: 0.97)
    public static let surface = Color.white
    public static let onPrimary = Color.white
    public static let onBackground = Color(red: 0.1, green: 0.1, blue: 0.1)
    public static let error = Color(red: 0.96, green: 0.26, blue: 0.21)
}

/// Gazgin typography tokens.
public enum GazginTypography {
    public static let titleLarge = Font.system(size: 28, weight: .bold)
    public static let titleMedium = Font.system(size: 22, weight: .semibold)
    public static let bodyLarge = Font.system(size: 16, weight: .regular)
    public static let bodyMedium = Font.system(size: 14, weight: .regular)
    public static let labelMedium = Font.system(size: 12, weight: .medium)
}
