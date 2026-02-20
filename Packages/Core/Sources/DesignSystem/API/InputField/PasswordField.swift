import SwiftUI

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

        value: Binding<String>, fieldType: InputFieldType = .base, placeholder: String = "Password", passwordVisible: Bool = false, enabled: Bool = true, readOnly: Bool = false, isError: Bool = false, @ViewBuilder trailingIcon: () -> Trailing

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

        value: Binding<String>, fieldType: InputFieldType = .base, placeholder: String = "Password", passwordVisible: Bool = false, enabled: Bool = true, readOnly: Bool = false, isError: Bool = false

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

            value: $value, fieldType: fieldType, inputTextType: .password, placeholder: placeholder, enabled: enabled, readOnly: readOnly, isError: isError, isSecure: !passwordVisible, trailingIcon: trailingIcon

        )

        .frame(height: GazginTheme.dimens.fieldHeight)

    }

}

// ──────────────────────────────────────────────

#Preview("PasswordField States") {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        PasswordField(value: $text, placeholder: "Password")
        PasswordField(value: .constant("secret123"), placeholder: "Visible", passwordVisible: true)
        PasswordField(value: .constant("secret123"), placeholder: "Masked", passwordVisible: false)
        PasswordField(value: .constant("secret123"), placeholder: "Error", isError: true)
    }
    .padding()
    .gazginTheme()
}
