import SwiftUI

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

        value: Binding<String>, fieldType: InputFieldType = .base, inputTextType: InputTextType = .default, placeholder: String = "Label", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false, @ViewBuilder leadingIcon: () -> Leading, @ViewBuilder trailingIcon: () -> Trailing

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

        value: Binding<String>, fieldType: InputFieldType = .base, inputTextType: InputTextType = .default, placeholder: String = "Label", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false

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

            value: $value, fieldType: fieldType, inputTextType: inputTextType, placeholder: placeholder, enabled: enabled, readOnly: readOnly, isError: isError, leadingIcon: leadingIcon, trailingIcon: trailingIcon

        )

        .frame(height: GazginTheme.dimens.fieldHeight)

    }

}

// ──────────────────────────────────────────────


#Preview("LabelField States") {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        LabelField(value: $text, placeholder: "LabelField Default")
        LabelField(value: .constant("Filled state"), placeholder: "LabelField Filled")
        LabelField(value: .constant("Error state"), placeholder: "Error", isError: true)
        LabelField(value: .constant("Disabled"), placeholder: "Disabled", enabled: false)
    }
    .padding()
    .gazginTheme()
}
