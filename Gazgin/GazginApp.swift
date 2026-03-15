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
    init() {
        DISetup.configure()
        WelcomeFeatureEntry.register()
        HomeFeatureEntry.register()
        ProfileFeatureEntry.register()
    }

    var body: some Scene {
        WindowGroup {
            if let welcomeView = Container.shared.welcomeNavigation()?.makeView() {
                welcomeView
            } else {
                TabView {
                    if let homeView = Container.shared.homeNavigation()?.makeView() {
                        homeView
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                    }

                    if let profileView = Container.shared.profileNavigation()?.makeView() {
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
