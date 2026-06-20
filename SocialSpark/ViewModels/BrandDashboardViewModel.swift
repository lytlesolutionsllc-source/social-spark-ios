import Foundation

final class BrandDashboardViewModel: ObservableObject {
    @Published var campaigns: [Campaign]
    let profile: BrandProfile

    init(service: MockDataServing = MockDataService()) {
        self.campaigns = service.campaigns
        self.profile = service.brandProfile
    }
}
