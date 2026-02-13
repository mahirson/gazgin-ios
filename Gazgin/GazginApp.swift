import SwiftUI
import SwiftData
import HomeImpl
import ProfileImpl
import DIImpl

@main
struct GazginApp: App {
    init() {
        DISetup.configure()
    }

    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        }
    }
}
