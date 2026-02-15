import SwiftUI

// MARK: - Type Scale Group (regular / medium / semibold / bold)

public struct TypeScaleStyles: Sendable {
    public let regular: Font
    public let medium: Font
    public let semibold: Font
    public let bold: Font
}

// MARK: - Full Typography Scheme

public struct GazginTypographyScheme: Sendable {
    public let display: TypeScaleStyles
    public let h1: TypeScaleStyles
    public let h2: TypeScaleStyles
    public let h3: TypeScaleStyles
    public let h4: TypeScaleStyles
    public let h5: TypeScaleStyles
    public let h6: TypeScaleStyles
    public let label: TypeScaleStyles
    public let body: TypeScaleStyles
}

// MARK: - Helper

private func typeScale(size: CGFloat) -> TypeScaleStyles {
    TypeScaleStyles(
        regular: .system(size: size, weight: .regular, design: .default),
        medium: .system(size: size, weight: .medium, design: .default),
        semibold: .system(size: size, weight: .semibold, design: .default),
        bold: .system(size: size, weight: .bold, design: .default)
    )
}

// MARK: - Default Typography (Figma source-of-truth)

/// Typography tokens from the Figma Travel App UI Kit.
/// Font: Inter (system San Francisco is used as the closest match).
///
/// Line heights are handled automatically by SwiftUI.
/// If you need explicit line spacing, apply `.lineSpacing()` modifier.
public let gazginTypography = GazginTypographyScheme(
    display: typeScale(size: 36),   // lineHeight: 44
    h1: typeScale(size: 32),        // lineHeight: 40
    h2: typeScale(size: 28),        // lineHeight: 36
    h3: typeScale(size: 24),        // lineHeight: 32
    h4: typeScale(size: 22),        // lineHeight: 30
    h5: typeScale(size: 20),        // lineHeight: 28
    h6: typeScale(size: 18),        // lineHeight: 26
    label: typeScale(size: 12),     // lineHeight: 14
    body: typeScale(size: 16)       // lineHeight: 24
)
