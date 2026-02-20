import SwiftUI

public struct GazginButton: View {
    public let text: String
    public let style: ButtonStyleColors
    public let isLoading: Bool
    public let isEnabled: Bool
    public let action: () -> Void

    public init(
        text: String,
        style: ButtonStyleColors,
        isLoading: Bool = false,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.isLoading = isLoading
        self.isEnabled = isEnabled
        self.action = action
    }

    public var body: some View {
        Button(action: {
            if !isLoading && isEnabled {
                action()
            }
        }) {
            GazginButtonStyleView(
                text: text,
                style: style,
                isLoading: isLoading,
                isEnabled: isEnabled
            )
        }
        .buttonStyle(GazginAnimatedButtonStyle())
        .disabled(!isEnabled || isLoading)
    }
}

// MARK: - Helper Views for state injection

private struct GazginButtonStyleView: View {
    let text: String
    let style: ButtonStyleColors
    let isLoading: Bool
    let isEnabled: Bool

    @Environment(\.isPressed) private var isPressed

    var body: some View {
        let currentState = resolveColors(isPressed: isPressed)

        HStack(spacing: GazginTheme.dimens.iconSpacing) {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: currentState.content))
                    .frame(width: GazginTheme.dimens.iconSize, height: GazginTheme.dimens.iconSize)
            }

            Text(text)
                .font(GazginTheme.typeface.body.semibold)
                .foregroundColor(currentState.content)
        }
        .padding(.horizontal, GazginTheme.dimens.horizontalPadding)
        .frame(height: GazginTheme.dimens.fieldHeight)
        .background(currentState.container)
        .cornerRadius(GazginTheme.dimens.cornerRadiusLarge)
        .overlay(
            RoundedRectangle(cornerRadius: GazginTheme.dimens.cornerRadiusLarge)
                .stroke(
                    currentState.border ?? Color.clear,
                    lineWidth: currentState.border != nil ? GazginTheme.dimens.borderWidth : 0
                )
        )
    }

    private func resolveColors(isPressed: Bool) -> ButtonStateColors {
        if !isEnabled {
            return style.disabled
        } else if isLoading {
            return style.loading
        } else if isPressed {
            return style.pressed
        } else {
            return style.normal
        }
    }
}

// Environment key to track the pressed state within the Button action closure mapping.
private struct IsPressedKey: EnvironmentKey {
    static let defaultValue = false
}

private extension EnvironmentValues {
    var isPressed: Bool {
        get { self[IsPressedKey.self] }
        set { self[IsPressedKey.self] = newValue }
    }
}

// Required to feed the intrinsic Button `isPressed` state down natively
private struct GazginAnimatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .environment(\.isPressed, configuration.isPressed)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Previews

struct GazginButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // Light Mode
            stylesPreview(scheme: .light)
                .previewDisplayName("Light Mode")

            // Dark Mode
            stylesPreview(scheme: .dark)
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
        .padding()
    }

    @ViewBuilder
    private static func stylesPreview(scheme: ColorScheme) -> some View {
        let styles = GazginTheme.styles(for: scheme)

        VStack(spacing: 16) {
            Text("Primary")
                .font(GazginTheme.typeface.h5.bold)

            VStack(spacing: 10) {
                GazginButton(text: "Primary Normal", style: styles.primary) {}
                GazginButton(text: "Primary Disabled", style: styles.primary, isEnabled: false) {}
                GazginButton(text: "Primary Loading", style: styles.primary, isLoading: true) {}
            }

            Divider()

            Text("Secondary")
                .font(GazginTheme.typeface.h5.bold)

            VStack(spacing: 10) {
                GazginButton(text: "Secondary Normal", style: styles.secondary) {}
                GazginButton(text: "Secondary Disabled", style: styles.secondary, isEnabled: false) {}
                GazginButton(text: "Secondary Loading", style: styles.secondary, isLoading: true) {}
            }
        }
        .padding()
        .background(GazginTheme.colors(for: scheme).background)
        .gazginTheme()
    }
}
