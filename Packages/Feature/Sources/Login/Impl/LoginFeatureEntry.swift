import SwiftUI
import Navigation
import DI
import Factory

public struct LoginFeatureEntry: FeatureEntry {
    public init() {}

    public func makeView() -> AnyView {
        AnyView(LoginView())
    }

    public static func register() {
        Container.shared.loginNavigation.register { LoginFeatureEntry() }
    }
}
