import SwiftUI

// MARK: - BaseInputField

/// Core input field view for the Gazgin design system.

///

/// All semantic field views (`LabelField`, `EmailField`, `NameField`,

/// `PasswordField`, `TextArea`) delegate to this view.

///

/// Colors are resolved from `@Environment(\.gazginColors)`, typography

/// from `GazginTheme.typeface`, and dimensions from `GazginTheme.dimens`.

///

/// Layout (horizontal):

/// ```

/// ┌───────────────────────────────────────────────┐

/// │ [leadingIcon]  [text / placeholder]  [trailingIcon] │

/// └───────────────────────────────────────────────┘

/// ```

///

/// Usage:

/// ```swift

/// // Simple text field

/// BaseInputField(value: $text, placeholder: "Enter text")

///

/// // With icons

/// BaseInputField(

///     value: $text,

///     placeholder: "Search",

///     leadingIcon: { Image(systemName: "magnifyingglass") },

///     trailingIcon: { Image(systemName: "xmark.circle.fill") }

/// )

/// ```

public struct BaseInputField: View {

    @Binding private var value: String

    private let fieldType: InputFieldType

    private let inputTextType: InputTextType

    private let placeholder: String

    private let enabled: Bool

    private let readOnly: Bool

    private let isError: Bool

    private let singleLine: Bool

    private let isSecure: Bool

    private let shape: RoundedRectangle

    private let textFont: Font

    private let leadingIcon: AnyView?

    private let trailingIcon: AnyView?

    @FocusState private var isFocused: Bool

    @Environment(\.gazginColors) private var colors

    // MARK: - Internal Init (used by specialized fields)

    init(

        value: Binding<String>, fieldType: InputFieldType = .base, inputTextType: InputTextType = .default, placeholder: String = "", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false, singleLine: Bool = true, isSecure: Bool = false, shape: RoundedRectangle = InputFieldShape.default, textFont: Font = GazginTheme.typeface.body.medium, leadingIcon: AnyView? = nil, trailingIcon: AnyView? = nil

    ) {

        self._value = value

        self.fieldType = fieldType

        self.inputTextType = inputTextType

        self.placeholder = placeholder

        self.enabled = enabled

        self.readOnly = readOnly

        self.isError = isError

        self.singleLine = singleLine

        self.isSecure = isSecure

        self.shape = shape

        self.textFont = textFont

        self.leadingIcon = leadingIcon

        self.trailingIcon = trailingIcon

    }

    // MARK: - Public Init with ViewBuilder Icons

    /// Creates a base input field with leading and trailing icon slots.

    ///

    /// - Parameters:

    ///   - value: Binding to the current text value.

    ///   - fieldType: Visual style variant.

    ///   - inputTextType: Keyboard / input behaviour.

    ///   - placeholder: Text shown when `value` is empty.

    ///   - enabled: Whether the field accepts user input.

    ///   - readOnly: Whether the field is read-only (focusable but not editable).

    ///   - isError: Whether to apply error-state styling.

    ///   - singleLine: Constrains the field to a single line.

    ///   - isSecure: Whether to mask the text (password mode).

    ///   - shape: Background / border shape.

    ///   - textFont: Font applied to the input text.

    ///   - leadingIcon: View rendered before the text region.

    ///   - trailingIcon: View rendered after the text region.

    public init<Leading: View, Trailing: View>(

        value: Binding<String>, fieldType: InputFieldType = .base, inputTextType: InputTextType = .default, placeholder: String = "", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false, singleLine: Bool = true, isSecure: Bool = false, shape: RoundedRectangle = InputFieldShape.default, textFont: Font = GazginTheme.typeface.body.medium, @ViewBuilder leadingIcon: () -> Leading, @ViewBuilder trailingIcon: () -> Trailing

    ) {

        let leading = leadingIcon()

        let trailing = trailingIcon()

        self.init(

            value: value, fieldType: fieldType, inputTextType: inputTextType, placeholder: placeholder, enabled: enabled, readOnly: readOnly, isError: isError, singleLine: singleLine, isSecure: isSecure, shape: shape, textFont: textFont, leadingIcon: (Leading.self == EmptyView.self) ? nil : AnyView(leading), trailingIcon: (Trailing.self == EmptyView.self) ? nil : AnyView(trailing)

        )

    }

    // MARK: - Public Init without Icons

    /// Creates a base input field without leading or trailing icons.

    public init(

        value: Binding<String>, fieldType: InputFieldType = .base, inputTextType: InputTextType = .default, placeholder: String = "", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false, singleLine: Bool = true, isSecure: Bool = false, shape: RoundedRectangle = InputFieldShape.default, textFont: Font = GazginTheme.typeface.body.medium

    ) {

        self.init(

            value: value, fieldType: fieldType, inputTextType: inputTextType, placeholder: placeholder, enabled: enabled, readOnly: readOnly, isError: isError, singleLine: singleLine, isSecure: isSecure, shape: shape, textFont: textFont, leadingIcon: nil, trailingIcon: nil

        )

    }

    // MARK: - Body

    public var body: some View {

        let dimens = GazginTheme.dimens

        let effectiveBinding: Binding<String> = (enabled && !readOnly)

            ? $value

            : .init(get: { value }, set: { _ in })

        HStack(spacing: dimens.iconSpacing) {

            if let leadingIcon {

                leadingIcon

            }

            ZStack(alignment: singleLine ? .leading : .topLeading) {

                if value.isEmpty {

                    Text(placeholder)

                        .font(textFont)

                        .foregroundStyle(placeholderColor)

                }

                Group {

                    if isSecure {

                        SecureField("", text: effectiveBinding)

                    } else if singleLine {

                        TextField("", text: effectiveBinding)

                    } else {

                        TextField("", text: effectiveBinding, axis: .vertical)

                            .lineLimit(3...)

                    }

                }

                .font(textFont)

                .foregroundStyle(textColor)

                .textFieldStyle(.plain)

                .focused($isFocused)

                .tint(colors.primary.base)

                .inputKeyboardType(inputTextType)

            }

            .frame(maxWidth: .infinity, alignment: .leading)

            if let trailingIcon {

                trailingIcon

            }

        }

        .padding(.horizontal, dimens.horizontalPadding)

        .padding(.vertical, dimens.verticalPadding)

        .background(backgroundColor, in: shape)

        .overlay {

            shape.stroke(borderColor, lineWidth: dimens.borderWidth)

        }

        .allowsHitTesting(enabled)

        .contentShape(shape)

    }

    // MARK: - Computed Colors

    private var borderColor: Color {

        if isError { return colors.alert.error.base }

        if !enabled { return colors.gray.gray200.opacity(0.6) }

        if fieldType == .bordered { return colors.primary.base }

        if isFocused { return colors.primary.base }

        return colors.gray.gray200

    }

    private var backgroundColor: Color {

        enabled ? colors.gray.gray100 : colors.gray.gray100.opacity(0.6)

    }

    private var textColor: Color {

        enabled ? colors.gray.gray900 : colors.gray.gray400

    }

    private var placeholderColor: Color {

        colors.gray.gray500

    }

}
