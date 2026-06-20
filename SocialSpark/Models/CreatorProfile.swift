import Foundation

struct CreatorProfile: Hashable {
    let username: String
    let level: String
    let completedMissions: Int
    let pendingCoins: Int
    let approvedCoins: Int
    let lifetimeCoins: Int
}
