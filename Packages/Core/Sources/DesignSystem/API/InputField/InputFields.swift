import SwiftUI

// ──────────────────────────────────────────────
// MARK: - LabelField — Generic Text Input
// ──────────────────────────────────────────────

/// Generic single-line text input with a "Label" placeholder.
///
/// Usage:
/// ```swift
/// @State private var text = ""
///
/// LabelField(value: $text)
///
/// // With icons
/// LabelField(
///     value: $text,
///     leadingIcon: { Image(systemName: "magnifyingglass") },
///     trailingIcon: { Image(systemName: "xmark.circle.fill") }
/// )
/// ```
public struct LabelField: View {
    @Binding private var value: String
    private let fieldType: InputFieldType
    private let inputTextType: InputTextType
    private let placeholder: String
    private let enabled: Bool
    private let readOnly: Bool
    private let isError: Bool
    private let leadingIcon: AnyView?
    private let trailingIcon: AnyView?

    /// Creates a label field with leading and trailing icon slots.
    public init<Leading: View, Trailing: View>(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        inputTextType: InputTextType = .default,
        placeholder: String = "Label",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false,
        @ViewBuilder leadingIcon: () -> Leading,
        @ViewBuilder trailingIcon: () -> Trailing
    ) {
        self._value = value
        self.fieldType = fieldType
        self.inputTextType = inputTextType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        let l = leadingIcon()
        let t = trailingIcon()
        self.leadingIcon = (Leading.self == EmptyView.self) ? nil : AnyView(l)
        self.trailingIcon = (Trailing.self == EmptyView.self) ? nil : AnyView(t)
    }

    /// Creates a label field without icons.
    public init(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        inputTextType: InputTextType = .default,
        placeholder: String = "Label",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false
    ) {
        self._value = value
        self.fieldType = fieldType
        self.inputTextType = inputTextType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        self.leadingIcon = nil
        self.trailingIcon = nil
    }

    public var body: some View {
        BaseInputField(
            value: $value,
            fieldType: fieldType,
            inputTextType: inputTextType,
            placeholder: placeholder,
            enabled: enabled,
            readOnly: readOnly,
            isError: isError,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon
        )
        .frame(height: GazginTheme.dimens.fieldHeight)
    }
}

// ──────────────────────────────────────────────
// MARK: - EmailField — Email Address Input
// ──────────────────────────────────────────────

/// Email address input with email-optimised keyboard.
///
/// Usage:
/// ```swift
/// @State private var email = ""
/// EmailField(value: $email)
/// ```
public struct EmailField: View {
    @Binding private var value: String
    private let fieldType: InputFieldType
    private let placeholder: String
    private let enabled: Bool
    private let readOnly: Bool
    private let isError: Bool
    private let leadingIcon: AnyView?
    private let trailingIcon: AnyView?

    /// Creates an email field with leading and trailing icon slots.
    public init<Leading: View, Trailing: View>(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        placeholder: String = "Email address",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false,
        @ViewBuilder leadingIcon: () -> Leading,
        @ViewBuilder trailingIcon: () -> Trailing
    ) {
        self._value = value
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        let l = leadingIcon()
        let t = trailingIcon()
        self.leadingIcon = (Leading.self == EmptyView.self) ? nil : AnyView(l)
        self.trailingIcon = (Trailing.self == EmptyView.self) ? nil : AnyView(t)
    }

    /// Creates an email field without icons.
    public init(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        placeholder: String = "Email address",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false
    ) {
        self._value = value
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        self.leadingIcon = nil
        self.trailingIcon = nil
    }

    public var body: some View {
        BaseInputField(
            value: $value,
            fieldType: fieldType,
            inputTextType: .email,
            placeholder: placeholder,
            enabled: enabled,
            readOnly: readOnly,
            isError: isError,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon
        )
        .frame(height: GazginTheme.dimens.fieldHeight)
    }
}

// ──────────────────────────────────────────────
// MARK: - NameField — Full Name Input
// ──────────────────────────────────────────────

/// Full-name input with word capitalisation.
///
/// Usage:
/// ```swift
/// @State private var name = ""
/// NameField(value: $name)
/// ```
public struct NameField: View {
    @Binding private var value: String
    private let fieldType: InputFieldType
    private let placeholder: String
    private let enabled: Bool
    private let readOnly: Bool
    private let isError: Bool
    private let leadingIcon: AnyView?
    private let trailingIcon: AnyView?

    /// Creates a name field with leading and trailing icon slots.
    public init<Leading: View, Trailing: View>(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        placeholder: String = "Fullname",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false,
        @ViewBuilder leadingIcon: () -> Leading,
        @ViewBuilder trailingIcon: () -> Trailing
    ) {
        self._value = value
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        let l = leadingIcon()
        let t = trailingIcon()
        self.leadingIcon = (Leading.self == EmptyView.self) ? nil : AnyView(l)
        self.trailingIcon = (Trailing.self == EmptyView.self) ? nil : AnyView(t)
    }

    /// Creates a name field without icons.
    public init(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        placeholder: String = "Fullname",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false
    ) {
        self._value = value
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        self.leadingIcon = nil
        self.trailingIcon = nil
    }

    public var body: some View {
        BaseInputField(
            value: $value,
            fieldType: fieldType,
            inputTextType: .name,
            placeholder: placeholder,
            enabled: enabled,
            readOnly: readOnly,
            isError: isError,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon
        )
        .frame(height: GazginTheme.dimens.fieldHeight)
    }
}

// ──────────────────────────────────────────────
// MARK: - PasswordField — Password Input
// ──────────────────────────────────────────────

/// Password input with optional visibility toggle.
///
/// Supply your own `trailingIcon` with the eye-off / eye-on icon:
/// ```swift
/// @State private var password = ""
/// @State private var visible = false
///
/// PasswordField(
///     value: $password,
///     passwordVisible: visible
/// ) {
///     Button { visible.toggle() } label: {
///         Image(systemName: visible ? "eye" : "eye.slash")
///             .frame(width: 20, height: 20)
///     }
/// }
/// ```
public struct PasswordField: View {
    @Binding private var value: String
    private let fieldType: InputFieldType
    private let placeholder: String
    private let passwordVisible: Bool
    private let enabled: Bool
    private let readOnly: Bool
    private let isError: Bool
    private let trailingIcon: AnyView?

    /// Creates a password field with a trailing icon slot (visibility toggle).
    public init<Trailing: View>(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        placeholder: String = "Password",
        passwordVisible: Bool = false,
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false,
        @ViewBuilder trailingIcon: () -> Trailing
    ) {
        self._value = value
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.passwordVisible = passwordVisible
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        let t = trailingIcon()
        self.trailingIcon = (Trailing.self == EmptyView.self) ? nil : AnyView(t)
    }

    /// Creates a password field without a trailing icon.
    public init(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        placeholder: String = "Password",
        passwordVisible: Bool = false,
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false
    ) {
        self._value = value
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.passwordVisible = passwordVisible
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
        self.trailingIcon = nil
    }

    public var body: some View {
        BaseInputField(
            value: $value,
            fieldType: fieldType,
            inputTextType: .password,
            placeholder: placeholder,
            enabled: enabled,
            readOnly: readOnly,
            isError: isError,
            isSecure: !passwordVisible,
            trailingIcon: trailingIcon
        )
        .frame(height: GazginTheme.dimens.fieldHeight)
    }
}

// ──────────────────────────────────────────────
// MARK: - TextArea — Multi-line Text Input
// ──────────────────────────────────────────────

/// Multi-line text area with a default height of 140pt.
///
/// Usage:
/// ```swift
/// @State private var bio = ""
/// TextArea(value: $bio, placeholder: "Tell us about yourself")
/// ```
public struct TextArea: View {
    @Binding private var value: String
    private let fieldType: InputFieldType
    private let inputTextType: InputTextType
    private let placeholder: String
    private let enabled: Bool
    private let readOnly: Bool
    private let isError: Bool

    public init(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        inputTextType: InputTextType = .default,
        placeholder: String = "Label",
        enabled: Bool = true,
        readOnly: Bool = false,
        isError: Bool = false
    ) {
        self._value = value
        self.fieldType = fieldType
        self.inputTextType = inputTextType
        self.placeholder = placeholder
        self.enabled = enabled
        self.readOnly = readOnly
        self.isError = isError
    }

    public var body: some View {
        BaseInputField(
            value: $value,
            fieldType: fieldType,
            inputTextType: inputTextType,
            placeholder: placeholder,
            enabled: enabled,
            readOnly: readOnly,
            isError: isError,
            singleLine: false
        )
        .frame(height: GazginTheme.dimens.textAreaHeight)
    }
}

// ──────────────────────────────────────────────
// MARK: - CodeField — Single-digit OTP / Code Input
// ──────────────────────────────────────────────

/// Square, single-character input for OTP / verification codes.
///
/// Compose a row of `CodeField`s for a full OTP input:
/// ```swift
/// @State private var digits = Array(repeating: "", count: 6)
///
/// HStack(spacing: 12) {
///     ForEach(0..<6, id: \.self) { index in
///         CodeField(
///             value: $digits[index],
///             isError: hasError
///         )
///     }
/// }
/// ```
public struct CodeField: View {
    @Binding private var value: String
    private let fieldType: InputFieldType
    private let enabled: Bool
    private let isError: Bool

    @FocusState private var isFocused: Bool
    @Environment(\.gazginColors) private var colors

    public init(
        value: Binding<String>,
        fieldType: InputFieldType = .base,
        enabled: Bool = true,
        isError: Bool = false
    ) {
        self._value = value
        self.fieldType = fieldType
        self.enabled = enabled
        self.isError = isError
    }

    public var body: some View {
        let dimens = GazginTheme.dimens

        TextField("", text: limitedBinding)
            .font(GazginTheme.typeface.h3.semibold)
            .foregroundStyle(textColor)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .textFieldStyle(.plain)
            .focused($isFocused)
            .tint(colors.primary.base)
            .frame(width: dimens.codeFieldSize, height: dimens.codeFieldSize)
            .background(backgroundColor, in: InputFieldShape.code)
            .overlay {
                InputFieldShape.code
                    .stroke(borderColor, lineWidth: dimens.borderWidth)
            }
            .allowsHitTesting(enabled)
            .contentShape(InputFieldShape.code)
    }

    // MARK: - Limited Binding (single character)

    private var limitedBinding: Binding<String> {
        Binding(
            get: { value },
            set: { newValue in
                if newValue.count <= 1 {
                    value = newValue
                }
            }
        )
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
}
