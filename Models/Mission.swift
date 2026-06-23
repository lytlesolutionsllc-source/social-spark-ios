import Foundation

enum MissionPlatform: String, CaseIterable, Codable, Identifiable {
    case instagram = "Instagram"
    case tiktok = "TikTok"

    var id: String { rawValue }
}

struct MissionAction: Identifiable, Codable, Hashable {
    let id = UUID()
    var title: String
    var coinReward: Int
    var isCompleted: Bool = false
}

struct Mission: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var brandName: String
    var brandSnippet: String
    var totalRewardCoins: Int
    var platform: MissionPlatform
    var actions: [MissionAction]

    // Creator-specific state (mock/local)
    var hasOptedIn: Bool = false
    var isNotInterested: Bool = false
}
