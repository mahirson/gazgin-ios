import SwiftUI
import DesignSystemAPI
import DesignSystemImpl

@Observable
public final class HomeViewModel: @unchecked Sendable {
    public init() {}
}

public struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Text("Home")
                .font(GazginTypography.titleLarge)
                .foregroundColor(GazginColors.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gazginTheme()
    }
}
