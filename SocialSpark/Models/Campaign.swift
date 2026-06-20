import Foundation

struct Campaign: Identifiable, Hashable {
    let id: UUID
    let title: String
    let platform: String
    let missionCount: Int
    let completedMissionCount: Int
    let status: CampaignStatus
    let package: CampaignPackage
    let addOns: [CampaignAddOn]

    var progress: Double {
        guard missionCount > 0 else { return 0 }
        return Double(completedMissionCount) / Double(missionCount)
    }

    enum CampaignStatus: String, CaseIterable, Hashable {
        case draft = "Draft"
        case active = "Active"
        case paused = "Paused"
        case completed = "Completed"
    }
}
