import Foundation

final class SparkWalletViewModel: ObservableObject {
    let profile: CreatorProfile

    init(service: MockDataServing = MockDataService()) {
        self.profile = service.creatorProfile
    }
}
