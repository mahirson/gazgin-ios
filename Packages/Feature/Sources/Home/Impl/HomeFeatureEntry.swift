import SwiftUI
import Navigation
import DI
import Factory

public struct HomeFeatureEntry: FeatureEntry {
    public init() {}

    public func makeView() -> AnyView {
        AnyView(HomeView())
    }

    public static func register() {
        Container.shared.homeNavigation.register { HomeFeatureEntry() }
    }
}
