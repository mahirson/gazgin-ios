import SwiftUI
import SwiftData
import Home
import Profile
import Welcome
import Login
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
        LoginFeatureEntry.register()
    }

    var body: some Scene {
        WindowGroup {
            if let welcomeView = Container.shared.welcomeNavigation()?.makeView() {
                NavigationStack {
                    welcomeView
                        .ignoresSafeArea()
                        .toolbar(.hidden, for: .navigationBar)
                }
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
