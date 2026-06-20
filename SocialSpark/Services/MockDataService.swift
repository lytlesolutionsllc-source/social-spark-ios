import Foundation

protocol MockDataServing {
    var creatorProfile: CreatorProfile { get }
    var brandProfile: BrandProfile { get }
    var missions: [Mission] { get }
    var campaigns: [Campaign] { get }
    var packages: [CampaignPackage] { get }
    var coinSettings: SparkCoinSettings { get }
    var appSettings: AppSettings { get }
}

struct MockDataService: MockDataServing {
    var creatorProfile: CreatorProfile { MockSeeds.creator }
    var brandProfile: BrandProfile { MockSeeds.brand }
    var missions: [Mission] { MockSeeds.missions }
    var campaigns: [Campaign] { MockSeeds.campaigns }
    var packages: [CampaignPackage] { MockSeeds.packages }
    var coinSettings: SparkCoinSettings { MockSeeds.coinSettings }
    var appSettings: AppSettings { MockSeeds.appSettings }
}
