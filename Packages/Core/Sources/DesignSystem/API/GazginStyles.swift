import SwiftUI

public struct ButtonStateColors: Sendable {
    public let container: Color
    public let content: Color
    public let border: Color?

    public init(container: Color, content: Color, border: Color? = nil) {
        self.container = container
        self.content = content
        self.border = border
    }
}

public struct ButtonStyleColors: Sendable {
    public let normal: ButtonStateColors
    public let pressed: ButtonStateColors
    public let disabled: ButtonStateColors
    public let loading: ButtonStateColors
}

public struct GazginButtonStyles: Sendable {
    public let primary: ButtonStyleColors
    public let secondary: ButtonStyleColors
}

public struct GazginStyles: Sendable {
    public let button: GazginButtonStyles
}

public func gazginStyles(for colors: GazginColorScheme, isDark: Bool) -> GazginStyles {
    let disabledContainer = isDark ? colors.gray.gray800 : colors.gray.gray200
    let disabledContent = isDark ? colors.gray.gray600 : colors.gray.gray400

    return GazginStyles(
        button: GazginButtonStyles(
            primary: ButtonStyleColors(
                normal: ButtonStateColors(container: colors.primary.base, content: colors.onPrimary),
                pressed: ButtonStateColors(container: colors.primary.shade400, content: colors.onPrimary),
                disabled: ButtonStateColors(container: disabledContainer, content: disabledContent),
                loading: ButtonStateColors(container: colors.primary.shade300, content: colors.onPrimary)
            ),
            secondary: ButtonStyleColors(
                normal: ButtonStateColors(container: colors.white, content: colors.outlineSecondary, border: colors.outlineSecondary),
                pressed: ButtonStateColors(container: colors.gray.gray100, content: colors.outlineSecondary, border: colors.outlineSecondary),
                disabled: ButtonStateColors(container: disabledContainer, content: disabledContent),
                loading: ButtonStateColors(container: colors.white, content: colors.outlineSecondary, border: colors.outlineSecondary)
            )
        )
    )
}
