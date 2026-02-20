import SwiftUI

// MARK: - SearchField — Search Input

/// Search input field matching Figma "Search" component.
/// 
/// Implements 4 states dynamically:
/// - Initial: empty, unfocused (Search icon + "Search" placeholder)
/// - Active: empty, focused (Search icon + cursor + "x" clear icon)
/// - Typing: partially filled, focused (Search icon + typed text + "x" clear icon)
/// - Filled: filled, unfocused (Search icon + typed text)
public struct SearchField: View {
    @Binding private var value: String
    private let placeholder: String
    private let enabled: Bool
    
    @FocusState private var isFocused: Bool
    
    public init(
        value: Binding<String>,
        placeholder: String = "Search",
        enabled: Bool = true
    ) {
        self._value = value
        self.placeholder = placeholder
        self.enabled = enabled
    }
    
    public var body: some View {
        let showClearIcon = !value.isEmpty || isFocused
        
        BaseInputField(
            value: $value,
            fieldType: .base,
            inputTextType: .default,
            placeholder: placeholder,
            enabled: enabled,
            readOnly: false,
            isError: false,
            singleLine: true,
            isSecure: false,
            shape: RoundedRectangle(cornerRadius: GazginTheme.dimens.cornerRadiusLarge),
            textFont: GazginTheme.typeface.body.medium,
            leadingIcon: {
                GazginTheme.icons.search
                    .resizable()
                    .scaledToFit()
                    .frame(width: GazginTheme.dimens.iconSize, height: GazginTheme.dimens.iconSize)
                    .foregroundColor(GazginTheme.colors(for: .light).gray.gray500)
            },
            trailingIcon: {
                if showClearIcon {
                    Button {
                        value = ""
                    } label: {
                        GazginTheme.icons.close
                            .resizable()
                            .scaledToFit()
                            .frame(width: GazginTheme.dimens.iconSize, height: GazginTheme.dimens.iconSize)
                            .foregroundColor(GazginTheme.colors(for: .light).gray.gray500)
                    }
                }
            }
        )
        .focused($isFocused)
        .frame(height: 48)
    }
}

#Preview("SearchField States") {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        SearchField(value: $text, placeholder: "Initial / Active")
        SearchField(value: .constant("Search query"), placeholder: "Typing / Filled")
        SearchField(value: .constant("Disabled"), placeholder: "Disabled", enabled: false)
    }
    .padding()
    .gazginTheme()
}
