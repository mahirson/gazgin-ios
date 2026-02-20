import SwiftUI

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

        value: Binding<String>, fieldType: InputFieldType = .base, enabled: Bool = true, isError: Bool = false

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

            get: { value }, set: { newValue in

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

#Preview("CodeField States") {
    @Previewable @State var text = ""
    HStack(spacing: 12) {
        CodeField(value: $text)
        CodeField(value: .constant("1"))
        CodeField(value: .constant("2"), isError: true)
        CodeField(value: .constant("3"), enabled: false)
    }
    .padding()
    .gazginTheme()
}
