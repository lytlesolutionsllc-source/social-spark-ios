import Foundation

struct Mission: Identifiable, Hashable {
    let id: UUID
    let title: String
    let brandName: String
    let description: String
    let totalReward: Int
    let actions: [MissionAction]
    let status: MissionStatus

    enum MissionStatus: String, Hashable {
        case available = "Available"
        case inProgress = "In Progress"
        case pendingReview = "Pending Review"
        case approved = "Approved"
    }
}
