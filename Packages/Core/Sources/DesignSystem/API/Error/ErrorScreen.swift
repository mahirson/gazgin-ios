import SwiftUI

public struct ErrorScreen: View {
    @Environment(\.gazginColors) private var colors
    @Environment(\.gazginStyles) private var styles
    @Environment(\.colorScheme) private var colorScheme

    public let config: ErrorConfig

    public init(config: ErrorConfig) {
        self.config = config
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()

                ErrorIllustration(errorCode: config.errorCode)
                    .padding(.bottom, 32)

                Text(config.title)
                    .font(GazginTheme.typeface.h3.bold)
                    .foregroundColor(colors.onBackground)
                    .multilineTextAlignment(.center)

                Text(config.message)
                    .font(GazginTheme.typeface.body.regular)
                    .foregroundColor(colors.gray.gray500)
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)
                    .padding(.horizontal, 16)

                Spacer()
            }
            .padding(.horizontal, 24)

            GazginButton(
                text: config.actionLabel,
                style: styles.button.primary,
                action: config.onAction
            )
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colors.background)
        .ignoresSafeArea(edges: .bottom)
    }
}

private struct ErrorIllustration: View {
    @Environment(\.gazginColors) private var colors

    let errorCode: String?

    var body: some View {
        ZStack {
            DecorativeDot(size: 10, color: colors.primary.base)
                .offset(x: 90, y: -62)

            DecorativeDot(size: 5, color: colors.gray.gray300)
                .offset(x: 102, y: -34)

            DecorativeDot(size: 5, color: colors.gray.gray300)
                .offset(x: 110, y: -14)

            DecorativeDot(size: 8, color: colors.primary.base)
                .offset(x: 106, y: 50)

            DecorativeDot(size: 5, color: colors.gray.gray300)
                .offset(x: 90, y: 62)

            DecorativeDot(size: 10, color: colors.gray.gray300)
                .offset(x: -98, y: 66)

            DecorativeDot(size: 5, color: colors.gray.gray300)
                .offset(x: -78, y: 58)

            illustrationCard
        }
        .frame(width: 260, height: 200)
    }

    private var illustrationCard: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(colors.gray.gray200, lineWidth: 1.5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(colors.surface)
                )
                .frame(width: 220, height: 140)

            if let code = errorCode {
                Text(code)
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(colors.primary.base)
                    .kerning(4)
            }

            xBadge
                .offset(x: -124, y: -84)

            VStack(spacing: 3) {
                ForEach(0..<2, id: \.self) { _ in
                    Capsule()
                        .fill(colors.gray.gray200)
                        .frame(width: 32, height: 4)
                }
            }
            .frame(width: 220, height: 140, alignment: .topTrailing)
            .padding(.top, 12)
            .padding(.trailing, 12)

            HStack(spacing: 5) {
                ForEach(0..<3, id: \.self) { _ in
                    Circle()
                        .fill(colors.gray.gray300)
                        .frame(width: 5, height: 5)
                }
            }
            .frame(width: 220, height: 140, alignment: .bottom)
            .padding(.bottom, 12)
        }
    }

    private var xBadge: some View {
        ZStack {
            Circle()
                .fill(colors.primary.base)
                .frame(width: 28, height: 28)

            GazginTheme.icons.times
                .resizable()
                .renderingMode(.template)
                .foregroundColor(colors.onPrimary)
                .frame(width: 14, height: 14)
        }
    }
}

private struct DecorativeDot: View {
    let size: CGFloat
    let color: Color

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorScreen(config: .notFound(onAction: {}))
                .gazginTheme()
                .previewDisplayName("404 – Light")

            ErrorScreen(config: .notFound(onAction: {}))
                .gazginTheme()
                .preferredColorScheme(.dark)
                .previewDisplayName("404 – Dark")

            ErrorScreen(config: .serverError(onAction: {}))
                .gazginTheme()
                .previewDisplayName("500")

            ErrorScreen(config: .networkError(onAction: {}))
                .gazginTheme()
                .previewDisplayName("No Connection")

            ErrorScreen(
                config: .generic(
                    errorCode: "503",
                    title: "Service Unavailable",
                    message: "We're doing some maintenance right now. Please check back soon.",
                    actionLabel: "Go Back",
                    onAction: {}
                )
            )
            .gazginTheme()
            .previewDisplayName("Custom")
        }
    }
}
