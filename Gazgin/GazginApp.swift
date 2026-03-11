import SwiftUI
import SwiftData
import Home
import Profile
import Welcome
import DI
import Navigation
import Factory

@main
struct GazginApp: App {
    @Injected(\.homeNavigation) private var homeNavigation
    @Injected(\.profileNavigation) private var profileNavigation
    @Injected(\.welcomeNavigation) private var welcomeNavigation

    init() {
        DISetup.configure()
        WelcomeFeatureEntry.register()
        HomeFeatureEntry.register()
        ProfileFeatureEntry.register()
    }

    var body: some Scene {
        WindowGroup {
            if let welcomeView = welcomeNavigation?.makeView() {
                welcomeView
            } else {
                TabView {
                    if let homeView = homeNavigation?.makeView() {
                        homeView
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                    }

                    if let profileView = profileNavigation?.makeView() {
                        profileView
                            .tabItem {
                                Label("Profile", systemImage: "person.fill")
                            }
                    }
                }
            }
        }
    }
}
