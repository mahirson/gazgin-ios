import SwiftUI

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

        value: Binding<String>, fieldType: InputFieldType = .base, placeholder: String = "Email address", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false, @ViewBuilder leadingIcon: () -> Leading, @ViewBuilder trailingIcon: () -> Trailing

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

        value: Binding<String>, fieldType: InputFieldType = .base, placeholder: String = "Email address", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false

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

            value: $value, fieldType: fieldType, inputTextType: .email, placeholder: placeholder, enabled: enabled, readOnly: readOnly, isError: isError, leadingIcon: leadingIcon, trailingIcon: trailingIcon

        )

        .frame(height: GazginTheme.dimens.fieldHeight)

    }

}

// ──────────────────────────────────────────────

#Preview("EmailField States") {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        EmailField(value: $text, placeholder: "EmailField Default")
        EmailField(value: .constant("Filled state"), placeholder: "EmailField Filled")
        EmailField(value: .constant("Error state"), placeholder: "Error", isError: true)
        EmailField(value: .constant("Disabled"), placeholder: "Disabled", enabled: false)
    }
    .padding()
    .gazginTheme()
}
