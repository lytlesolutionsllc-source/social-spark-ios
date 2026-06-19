import Foundation

struct Mission: Identifiable, Codable {
    let id: String
    let campaignId: String
    let creatorId: String?
    let brandId: String
    let status: MissionStatus
    let totalCoinReward: Int
    let requiredActions: [MissionAction]
    let proofSubmission: ProofSubmission?
    let assignedAt: Date?
    let submittedAt: Date?
    let reviewedAt: Date?
    let paidAt: Date?
    let brandName: String
    let campaignTitle: String
    let description: String
    
    enum MissionStatus: String, Codable {
        case available
        case accepted
        case submitted
        case approved
        case rejected
        case paid
        case expired
    }
    
    var completedActionsCount: Int {
        requiredActions.filter { $0.completed }.count
    }
    
    var totalActions: Int {
        requiredActions.count
    }
    
    var progress: Double {
        guard totalActions > 0 else { return 0 }
        return Double(completedActionsCount) / Double(totalActions)
    }
}
