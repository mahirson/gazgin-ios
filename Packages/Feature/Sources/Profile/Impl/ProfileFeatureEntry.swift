import SwiftUI
import Navigation
import DI
import Factory

public struct ProfileFeatureEntry: FeatureEntry {
    public init() {}

    public func makeView() -> AnyView {
        AnyView(ProfileView())
    }

    public static func register() {
        Container.shared.profileNavigation.register { ProfileFeatureEntry() }
    }
}
