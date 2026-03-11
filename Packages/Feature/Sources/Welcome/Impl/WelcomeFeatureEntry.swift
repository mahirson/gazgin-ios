import SwiftUI
import Navigation
import DI
import Factory

public struct WelcomeFeatureEntry: FeatureEntry {
    public init() {}

    public func makeView() -> AnyView {
        AnyView(WelcomeView())
    }

    public static func register() {
        Container.shared.welcomeNavigation.register { WelcomeFeatureEntry() }
    }
}
