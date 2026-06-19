import Foundation

struct Campaign: Identifiable, Codable {
    let id: String
    let brandId: String
    let title: String
    let campaignUrl: String
    let platform: String
    let goal: CampaignGoal
    let packageType: PackageType
    let missionCount: Int
    let completedMissionCount: Int
    let pricePaidCents: Int
    let creatorPayoutPerMissionCoins: Int
    let campaignStatus: CampaignStatus
    let targeting: CampaignTargeting
    let addOns: [CampaignAddOn]
    let disclosureRequired: Bool
    let createdAt: Date
    let startDate: Date?
    let endDate: Date?
    
    enum CampaignGoal: String, Codable {
        case boostEngagement = "Boost engagement"
        case driveProfileVisits = "Drive profile visits"
        case increaseStoryShares = "Increase story shares"
        case getLinkClicks = "Get link clicks"
        case getQuizCompletions = "Get quiz completions"
        case getAppDownloads = "Get app downloads"
        case productLaunch = "Product launch"
        case localAwareness = "Local awareness"
        case websiteTraffic = "Website traffic"
    }
    
    enum CampaignStatus: String, Codable {
        case draft
        case pendingPayment
        case pendingAdminApproval
        case live
        case paused
        case completed
        case cancelled
    }
    
    var progress: Double {
        guard missionCount > 0 else { return 0 }
        return Double(completedMissionCount) / Double(missionCount)
    }
}

struct CampaignTargeting: Codable {
    let niches: [String]
    let minFollowers: Int?
    let maxFollowers: Int?
    let locations: [String]?
    let ageRange: (min: Int, max: Int)?
}
