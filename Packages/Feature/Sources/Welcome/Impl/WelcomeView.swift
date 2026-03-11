import SwiftUI
import DesignSystem

private struct WelcomePageData: Equatable {
    let title: String
    let description: String
    let primaryColor: Color
}

public struct WelcomeView: View {
    @State private var viewModel = WelcomeViewModel()
    @Environment(\.gazginColors) private var colors
    @Environment(\.gazginStyles) private var styles

    public init() {}

    public var body: some View {
        let state = viewModel.state
        let onIntent = viewModel.onIntent

        let pageData: [WelcomePageData] = [
            WelcomePageData(
                title: String(localized: "welcome_explore_world", defaultValue: "Explore The Beautiful World"),
                description: String(localized: "welcome_explore_world_desc", defaultValue: "Discover amazing places and breathtaking views all around the globe with our carefully curated travel itineraries."),
                primaryColor: Color(hex: 0xFF0D47A1) // Placeholder Color
            ),
            WelcomePageData(
                title: String(localized: "welcome_choose_destination", defaultValue: "Choose Your Destination"),
                description: String(localized: "welcome_choose_destination_desc", defaultValue: "Select from thousands of exotic locations tailored to your preferences and travel style."),
                primaryColor: Color(hex: 0xFF1B5E20) // Placeholder Color
            ),
            WelcomePageData(
                title: String(localized: "welcome_enjoy_trip", defaultValue: "Enjoy Your Beautiful Trip"),
                description: String(localized: "welcome_enjoy_trip_desc", defaultValue: "Relax, explore, and create unforgettable memories while we take care of all the planning and logistics."),
                primaryColor: Color(hex: 0xFFE65100) // Placeholder Color
            )
        ]

        ZStack {
            TabView(selection: Binding(
                get: { state.currentPage },
                set: { onIntent(.onPageChanged($0)) }
            )) {
                ForEach(0..<pageData.count, id: \.self) { index in
                    WelcomePage(data: pageData[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()

            VStack {
                // Top Header
                HStack {
                    Spacer()
                    Button {
                        onIntent(.onSkip)
                    } label: {
                        Text(String(localized: "welcome_skip", defaultValue: "Skip"))
                            .font(GazginTheme.typeface.body.semibold)
                            .foregroundColor(GazginColors.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(GazginColors.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.top, 48)
                .padding(.horizontal, 24)

                Spacer()

                // Bottom Controls
                VStack(spacing: 32) {
                    // Page Indicator
                    HStack(spacing: 8) {
                        ForEach(0..<3, id: \.self) { index in
                            let isSelected = state.currentPage == index
                            RoundedRectangle(cornerRadius: isSelected ? 4 : .infinity)
                                .fill(isSelected ? colors.primary.base : GazginColors.white.opacity(0.5))
                                .frame(width: isSelected ? 24 : 8, height: 8)
                                .animation(.spring(), value: state.currentPage)
                        }
                    }

                    // Primary Button
                    GazginButton(
                        text: state.currentPage == 2 ? String(localized: "welcome_get_started", defaultValue: "Get Started") : String(localized: "welcome_next", defaultValue: "Next"),
                        style: styles.button.primary,
                        action: {
                            if state.currentPage < 2 {
                                onIntent(.onNextPage)
                            } else {
                                // TODO: Navigate to Home
                            }
                        }
                    )
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
            }
        }
        .gazginTheme()
    }
}

private struct WelcomePage: View {
    let data: WelcomePageData

    var body: some View {
        ZStack {
            data.primaryColor

            VStack {
                Spacer()
                VStack(spacing: 16) {
                    Text(data.title)
                        .font(GazginTheme.typeface.h2.bold)
                        .foregroundColor(GazginColors.white)
                        .multilineTextAlignment(.center)

                    Text(data.description)
                        .font(GazginTheme.typeface.body.regular)
                        .foregroundColor(GazginColors.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 180) // Height to avoid button overlap
            }
        }
    }
}

// SwiftUI Color extension for Hex
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

#Preview {
    WelcomeView()
}
