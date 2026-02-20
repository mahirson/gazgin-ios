import SwiftUI

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

        value: Binding<String>, fieldType: InputFieldType = .base, inputTextType: InputTextType = .default, placeholder: String = "Label", enabled: Bool = true, readOnly: Bool = false, isError: Bool = false

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

            value: $value, fieldType: fieldType, inputTextType: inputTextType, placeholder: placeholder, enabled: enabled, readOnly: readOnly, isError: isError, singleLine: false

        )

        .frame(height: GazginTheme.dimens.textAreaHeight)

    }

}

// ──────────────────────────────────────────────

#Preview("TextArea States") {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        TextArea(value: $text, placeholder: "TextArea Default")
        TextArea(value: .constant("Filled state"), placeholder: "TextArea Filled")
        TextArea(value: .constant("Error state"), placeholder: "Error", isError: true)
        TextArea(value: .constant("Disabled"), placeholder: "Disabled", enabled: false)
    }
    .padding()
    .gazginTheme()
}
