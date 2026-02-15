import SwiftUI

// MARK: - Dimension Tokens

/// Reusable dimension tokens for spacing, sizing, borders, and radii.

///

/// Access via `GazginTheme.dimens` from any view:

/// ```swift

/// GazginTheme.dimens.fieldHeight

/// GazginTheme.dimens.horizontalPadding

/// ```

public struct GazginDimensions: Sendable {

    // MARK: Border

    public let borderWidth: CGFloat

    // MARK: Corner Radius

    public let cornerRadius: CGFloat

    public let cornerRadiusLarge: CGFloat

    // MARK: Padding / Spacing

    public let horizontalPadding: CGFloat

    public let verticalPadding: CGFloat

    public let iconSpacing: CGFloat

    // MARK: Component Sizing

    public let fieldHeight: CGFloat

    public let textAreaHeight: CGFloat

    public let codeFieldSize: CGFloat

    public let iconSize: CGFloat

    public init(

        borderWidth: CGFloat = 1, cornerRadius: CGFloat = 8, cornerRadiusLarge: CGFloat = 16, horizontalPadding: CGFloat = 16, verticalPadding: CGFloat = 16, iconSpacing: CGFloat = 12, fieldHeight: CGFloat = 56, textAreaHeight: CGFloat = 140, codeFieldSize: CGFloat = 56, iconSize: CGFloat = 20

    ) {

        self.borderWidth = borderWidth

        self.cornerRadius = cornerRadius

        self.cornerRadiusLarge = cornerRadiusLarge

        self.horizontalPadding = horizontalPadding

        self.verticalPadding = verticalPadding

        self.iconSpacing = iconSpacing

        self.fieldHeight = fieldHeight

        self.textAreaHeight = textAreaHeight

        self.codeFieldSize = codeFieldSize

        self.iconSize = iconSize

    }

}

// MARK: - Default Dimensions (Figma source-of-truth)

/// Default dimension values matching the Figma Travel App UI Kit.

public let gazginDimensions = GazginDimensions()
