import Foundation

final class CreatorDashboardViewModel: ObservableObject {
    @Published var missions: [Mission]
    let profile: CreatorProfile

    init(service: MockDataServing = MockDataService()) {
        self.missions = service.missions
        self.profile = service.creatorProfile
    }
}
