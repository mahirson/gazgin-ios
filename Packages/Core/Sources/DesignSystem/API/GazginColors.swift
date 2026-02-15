import SwiftUI

// MARK: - Raw Color Constants (Figma Travel App UI Kit)

/// Raw color hex values from the Figma design.
/// Prefer `GazginTheme.colors` in views for automatic dark/light mode.
public enum GazginColors {

    // MARK: Primary — Teal
    public static let primaryBase = Color(hex: 0x187A85)
    public static let primary400 = Color(hex: 0x1A8E9D)
    public static let primary300 = Color(hex: 0x1DA3B6)
    public static let primary200 = Color(hex: 0x31BDD0)
    public static let primary100 = Color(hex: 0x80D8E4)
    public static let primary50 = Color(hex: 0xB1E8EF)

    // MARK: Secondary — Orange / Yellow
    public static let secondaryBase = Color(hex: 0xFF9141)
    public static let secondary400 = Color(hex: 0xFFB74E)
    public static let secondary300 = Color(hex: 0xFFCE55)
    public static let secondary200 = Color(hex: 0xFFE751)
    public static let secondary100 = Color(hex: 0xFFF183)
    public static let secondary50 = Color(hex: 0xFFF6A6)

    // MARK: Alerts — Success
    public static let successBase = Color(hex: 0x0CAF60)
    public static let successDark = Color(hex: 0x0BA259)
    public static let successLight = Color(hex: 0x55C790)

    // MARK: Alerts — Warning
    public static let warningBase = Color(hex: 0xFFD023)
    public static let warningDark = Color(hex: 0xE6BB20)
    public static let warningLight = Color(hex: 0xFFDE65)

    // MARK: Alerts — Error
    public static let errorBase = Color(hex: 0xFF4C6D)
    public static let errorDark = Color(hex: 0xE64462)
    public static let errorLight = Color(hex: 0xFF708A)

    // MARK: Gray Scale
    public static let gray50 = Color(hex: 0xFCFCFD)
    public static let gray100 = Color(hex: 0xF3F4F6)
    public static let gray200 = Color(hex: 0xE5E7EB)
    public static let gray300 = Color(hex: 0xD1D5DB)
    public static let gray400 = Color(hex: 0x9CA3AF)
    public static let gray500 = Color(hex: 0x6B7280)
    public static let gray600 = Color(hex: 0x4B5563)
    public static let gray700 = Color(hex: 0x374151)
    public static let gray800 = Color(hex: 0x1F2937)
    public static let gray900 = Color(hex: 0x111827)

    // MARK: Others
    public static let white = Color.white
    public static let black = Color.black
}

// MARK: - Color hex initializer

extension Color {
    init(hex: UInt32) {
        let r = Double((hex >> 16) & 0xFF) / 255.0
        let g = Double((hex >> 8) & 0xFF) / 255.0
        let b = Double(hex & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
