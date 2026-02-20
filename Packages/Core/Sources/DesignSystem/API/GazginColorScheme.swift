import SwiftUI

// MARK: - Color Group Types

public struct PrimaryColors: Sendable {
    public let base: Color
    public let shade400: Color
    public let shade300: Color
    public let shade200: Color
    public let shade100: Color
    public let shade50: Color
}

public struct SecondaryColors: Sendable {
    public let base: Color
    public let shade400: Color
    public let shade300: Color
    public let shade200: Color
    public let shade100: Color
    public let shade50: Color
}

public struct AlertStatusColors: Sendable {
    public let base: Color
    public let dark: Color
    public let light: Color
}

public struct AlertColors: Sendable {
    public let success: AlertStatusColors
    public let warning: AlertStatusColors
    public let error: AlertStatusColors
}

public struct GrayColors: Sendable {
    public let gray50: Color
    public let gray100: Color
    public let gray200: Color
    public let gray300: Color
    public let gray400: Color
    public let gray500: Color
    public let gray600: Color
    public let gray700: Color
    public let gray800: Color
    public let gray900: Color
}

// MARK: - Full Color Scheme

public struct GazginColorScheme: Sendable {
    public let primary: PrimaryColors
    public let secondary: SecondaryColors
    public let alert: AlertColors
    public let gray: GrayColors
    public let background: Color
    public let surface: Color
    public let onPrimary: Color
    public let onSecondary: Color
    public let onBackground: Color
    public let onSurface: Color
    public let outlineSecondary: Color
    public let white: Color
    public let black: Color
}

// MARK: - Light Palette (Figma source-of-truth)

public let lightGazginColors = GazginColorScheme(
    primary: PrimaryColors(
        base: GazginColors.primaryBase,
        shade400: GazginColors.primary400,
        shade300: GazginColors.primary300,
        shade200: GazginColors.primary200,
        shade100: GazginColors.primary100,
        shade50: GazginColors.primary50
    ),
    secondary: SecondaryColors(
        base: GazginColors.secondaryBase,
        shade400: GazginColors.secondary400,
        shade300: GazginColors.secondary300,
        shade200: GazginColors.secondary200,
        shade100: GazginColors.secondary100,
        shade50: GazginColors.secondary50
    ),
    alert: AlertColors(
        success: AlertStatusColors(
            base: GazginColors.successBase,
            dark: GazginColors.successDark,
            light: GazginColors.successLight
        ),
        warning: AlertStatusColors(
            base: GazginColors.warningBase,
            dark: GazginColors.warningDark,
            light: GazginColors.warningLight
        ),
        error: AlertStatusColors(
            base: GazginColors.errorBase,
            dark: GazginColors.errorDark,
            light: GazginColors.errorLight
        )
    ),
    gray: GrayColors(
        gray50: GazginColors.gray50,
        gray100: GazginColors.gray100,
        gray200: GazginColors.gray200,
        gray300: GazginColors.gray300,
        gray400: GazginColors.gray400,
        gray500: GazginColors.gray500,
        gray600: GazginColors.gray600,
        gray700: GazginColors.gray700,
        gray800: GazginColors.gray800,
        gray900: GazginColors.gray900
    ),
    background: GazginColors.gray50,
    surface: GazginColors.white,
    onPrimary: GazginColors.white,
    onSecondary: GazginColors.black,
    onBackground: GazginColors.gray900,
    onSurface: GazginColors.gray900,
    outlineSecondary: GazginColors.outlineSecondary,
    white: GazginColors.white,
    black: GazginColors.black
)

// MARK: - Dark Palette

public let darkGazginColors = GazginColorScheme(
    primary: PrimaryColors(
        base: GazginColors.primary200,
        shade400: GazginColors.primary100,
        shade300: GazginColors.primary50,
        shade200: GazginColors.primaryBase,
        shade100: Color(hex: 0x125C64),
        shade50: Color(hex: 0x0D4149)
    ),
    secondary: SecondaryColors(
        base: GazginColors.secondary300,
        shade400: GazginColors.secondary200,
        shade300: GazginColors.secondary100,
        shade200: GazginColors.secondaryBase,
        shade100: Color(hex: 0xCC7434),
        shade50: Color(hex: 0x99572A)
    ),
    alert: AlertColors(
        success: AlertStatusColors(
            base: GazginColors.successLight,
            dark: GazginColors.successBase,
            light: Color(hex: 0x86DDB0)
        ),
        warning: AlertStatusColors(
            base: GazginColors.warningLight,
            dark: GazginColors.warningBase,
            light: Color(hex: 0xFFEB99)
        ),
        error: AlertStatusColors(
            base: GazginColors.errorLight,
            dark: GazginColors.errorBase,
            light: Color(hex: 0xFF9AAD)
        )
    ),
    gray: GrayColors(
        gray50: GazginColors.gray900,
        gray100: GazginColors.gray800,
        gray200: GazginColors.gray700,
        gray300: GazginColors.gray600,
        gray400: GazginColors.gray500,
        gray500: GazginColors.gray400,
        gray600: GazginColors.gray300,
        gray700: GazginColors.gray200,
        gray800: GazginColors.gray100,
        gray900: GazginColors.gray50
    ),
    background: Color(hex: 0x0F1419),
    surface: Color(hex: 0x1A2028),
    onPrimary: GazginColors.gray900,
    onSecondary: GazginColors.gray900,
    onBackground: GazginColors.gray100,
    onSurface: GazginColors.gray100,
    outlineSecondary: GazginColors.outlineSecondaryDark,
    white: GazginColors.white,
    black: GazginColors.black
)
