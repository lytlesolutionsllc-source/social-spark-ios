import Foundation
import SwiftUI

final class CreatorViewModel: ObservableObject {
    enum MissionFilter: String, CaseIterable, Identifiable {
        case all = "All"
        case instagram = "Instagram"
        case tiktok = "TikTok"

        var id: String { rawValue }
    }

    @Published var selectedFilter: MissionFilter = .all
    @Published var missions: [Mission] = []

    // Wallet (mock)
    @Published var coinBalance: Int = 420
    @Published var cashBalance: Double = 16.80
    @Published var payoutRequested: Bool = false

    init() {
        loadMockMissions()
    }

    var visibleMissions: [Mission] {
        let active = missions.filter { !$0.isNotInterested }
        switch selectedFilter {
        case .all:
            return active
        case .instagram:
            return active.filter { $0.platform == .instagram }
        case .tiktok:
            return active.filter { $0.platform == .tiktok }
        }
    }

    func loadMockMissions() {
        missions = [
            Mission(
                id: UUID(),
                title: "Help boost this skincare reel",
                brandName: "Luma Skin",
                brandSnippet: "We’re looking for authentic engagement from beauty creators. Focus on skincare routine relevance and thoughtful comments.",
                totalRewardCoins: 60,
                platform: .instagram,
                actions: [
                    MissionAction(title: "Watch the reel", coinReward: 5),
                    MissionAction(title: "Like or save", coinReward: 5),
                    MissionAction(title: "Leave a thoughtful comment", coinReward: 15),
                    MissionAction(title: "Share to story", coinReward: 25),
                    MissionAction(title: "Click brand profile", coinReward: 10)
                ]
            ),
            Mission(
                id: UUID(),
                title: "Drive views to summer drop teaser",
                brandName: "NOVA Streetwear",
                brandSnippet: "Looking for creators who understand streetwear culture. Encourage discovery and profile visits.",
                totalRewardCoins: 50,
                platform: .tiktok,
                actions: [
                    MissionAction(title: "Watch full teaser", coinReward: 10),
                    MissionAction(title: "Like video", coinReward: 5),
                    MissionAction(title: "Comment your favorite look", coinReward: 15),
                    MissionAction(title: "Share with a friend", coinReward: 20)
                ]
            )
        ]
    }

    func optIn(to mission: Mission) {
        guard let idx = missions.firstIndex(where: { $0.id == mission.id }) else { return }
        missions[idx].hasOptedIn = true
    }

    func markNotInterested(_ mission: Mission) {
        guard let idx = missions.firstIndex(where: { $0.id == mission.id }) else { return }
        missions[idx].isNotInterested = true
    }

    // MARK: - Payout
    var canRequestPayout: Bool {
        cashBalance >= 20.0 && !payoutRequested
    }

    var payoutRuleText: String {
        "Minimum cashout is $20.00"
    }

    func requestPayout() {
        guard canRequestPayout else { return }
        payoutRequested = true
    }
}
