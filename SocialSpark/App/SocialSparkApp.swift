import SwiftUI

@main
struct SocialSparkApp: App {
    @StateObject private var appState = AppStateViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .preferredColorScheme(.dark)
        }
    }
}
