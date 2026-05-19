import SwiftUI
import DesignSystem
import UIKit

public struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    @Environment(\.gazginColors) private var colors
    @Environment(\.gazginStyles) private var styles
    @Environment(\.dismiss) private var dismiss

    public init() {}

    public var body: some View {
        let state = viewModel.state
        let onIntent = viewModel.onIntent

        ZStack {
            GazginColors.white.ignoresSafeArea()

            VStack(spacing: 0) {
                // Image Header
                Image("login_header_image_5f69ed", bundle: .main)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 468)
                    .frame(maxWidth: .infinity)
                    .clipped()

                Spacer()
            }
            .ignoresSafeArea(edges: .top)

            VStack {
                // Top Bar (simulate GazginTopBar)
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(GazginColors.black)
                            .padding(12)
                            .background(GazginColors.white.opacity(0.8))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)

                Spacer()

                // Bottom Sheet Container
                VStack(spacing: 0) {
                    Text(String(localized: "login_title", defaultValue: "Unlock The Ultimate Travel Experience"))
                        .font(GazginTheme.typeface.h1.bold)
                        .foregroundColor(GazginColors.gray900)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 12)
                        .padding(.bottom, 32)
                        .padding(.top, 32)

                    VStack(spacing: 16) {
                        SocialLoginButton(
                            text: String(localized: "login_continue_with_apple", defaultValue: "Continue with Apple"),
                            iconName: "ic_apple"
                        ) {
                            onIntent(.onAppleLoginClick)
                        }

                        SocialLoginButton(
                            text: String(localized: "login_continue_with_google", defaultValue: "Continue with Google"),
                            iconName: "ic_google"
                        ) {
                            onIntent(.onGoogleLoginClick)
                        }

                        SocialLoginButton(
                            text: String(localized: "login_continue_with_facebook", defaultValue: "Continue with Facebook"),
                            iconName: "ic_facebook"
                        ) {
                            onIntent(.onFacebookLoginClick)
                        }
                    }

                    Spacer().frame(height: 16)

                    GazginButton(
                        text: String(localized: "login_continue_without_signing_in", defaultValue: "Continue without signing in"),
                        style: styles.button.primary,
                        action: {
                            onIntent(.onContinueWithoutSignInClick)
                        }
                    )
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
                .background(
                    GazginColors.white
                        .clipShape(RoundedCornerShape(topStart: 40, topEnd: 40))
                        .ignoresSafeArea(edges: .bottom)
                )
            }
        }
        .gazginTheme()
        .navigationBarHidden(true)
    }
}

// Helper Shape for top rounded corners
private struct RoundedCornerShape: Shape {
    var topStart: CGFloat
    var topEnd: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: topStart, height: topEnd)
        )
        return Path(path.cgPath)
    }
}

private struct SocialLoginButton: View {
    let text: String
    let iconName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(iconName, bundle: .main)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Spacer()

                Text(text)
                    .font(GazginTheme.typeface.h5.semibold)
                    .foregroundColor(GazginColors.black)

                Spacer()

                // Invisible spacer to balance icon
                Spacer().frame(width: 24)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .padding(.horizontal, 16)
            .background(GazginColors.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(GazginColors.gray300, lineWidth: 1)
            )
        }
    }
}

#Preview {
    LoginView()
}
