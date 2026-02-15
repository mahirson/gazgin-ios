import SwiftUI
import DesignSystem

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
                .font(GazginTheme.typeface.h1.bold)
                .foregroundColor(GazginColors.primaryBase)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gazginTheme()
    }
}
