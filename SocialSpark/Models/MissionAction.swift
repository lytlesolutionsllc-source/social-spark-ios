import Foundation

struct MissionAction: Identifiable, Hashable {
    let id: UUID
    let title: String
    let coinReward: Int
    var isCompleted: Bool
}
