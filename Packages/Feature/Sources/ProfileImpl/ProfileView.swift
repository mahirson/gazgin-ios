import SwiftUI
import DesignSystemAPI
import DesignSystemImpl

@Observable
public final class ProfileViewModel: @unchecked Sendable {
    public init() {}
}

public struct ProfileView: View {
    @State private var viewModel = ProfileViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Text("Profile")
                .font(GazginTypography.titleLarge)
                .foregroundColor(GazginColors.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gazginTheme()
    }
}
