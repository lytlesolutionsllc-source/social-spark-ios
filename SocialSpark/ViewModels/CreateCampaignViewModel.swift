import Foundation

final class CreateCampaignViewModel: ObservableObject {
    @Published var campaignTitle = ""
    @Published var platform = "Instagram"
    @Published var selectedPackage: CampaignPackage?

    let platforms = ["Instagram", "TikTok", "YouTube Shorts"]
    let packages: [CampaignPackage]

    init(service: MockDataServing = MockDataService()) {
        self.packages = service.packages
        self.selectedPackage = service.packages.first
    }
}
