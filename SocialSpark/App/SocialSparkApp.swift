import SwiftUI

@main
struct SocialSparkApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isLoggedIn {
                if let user = appState.currentUser {
                    Group {
                        switch user.accountType {
                        case .creator:
                            CreatorDashboardView()
                        case .brand:
                            BrandDashboardView()
                        case .admin:
                            AdminDashboardView()
                        }
                    }
                    .environmentObject(appState)
                }
            } else {
                WelcomeView()
                    .environmentObject(appState)
            }
        }
    }
}

class AppState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUser: AppUser?
    @Published var creatorProfile: CreatorProfile?
    @Published var brandProfile: BrandProfile?
    
    func loginAsCreator() {
        let mockCreator = MockDataService.createMockCreator()
        self.currentUser = mockCreator.0
        self.creatorProfile = mockCreator.1
        self.isLoggedIn = true
    }
    
    func loginAsBrand() {
        let mockBrand = MockDataService.createMockBrand()
        self.currentUser = mockBrand.0
        self.brandProfile = mockBrand.1
        self.isLoggedIn = true
    }
    
    func loginAsAdmin() {
        let mockAdmin = MockDataService.createMockAdmin()
        self.currentUser = mockAdmin
        self.isLoggedIn = true
    }
    
    func logout() {
        self.currentUser = nil
        self.creatorProfile = nil
        self.brandProfile = nil
        self.isLoggedIn = false
    }
}
