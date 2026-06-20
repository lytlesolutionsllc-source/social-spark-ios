import Foundation

enum MockSeeds {
    static let creator = CreatorProfile(
        username: "@AlexCreator",
        level: "Trusted Spark",
        completedMissions: 23,
        pendingCoins: 180,
        approvedCoins: 620,
        lifetimeCoins: 4240
    )

    static let brand = BrandProfile(
        brandName: "Glow Skincare",
        industry: "Beauty",
        activeCampaigns: 2,
        totalSpend: 74900
    )

    static let packages: [CampaignPackage] = [
        .init(id: UUID(), name: "Starter Spark", missionsIncluded: 25, priceCents: 9900, subtitle: "Quick traction"),
        .init(id: UUID(), name: "Growth Boost", missionsIncluded: 75, priceCents: 24900, subtitle: "Steady growth"),
        .init(id: UUID(), name: "Viral Wave", missionsIncluded: 200, priceCents: 59900, subtitle: "Launch moments")
    ]

    static let addOns: [CampaignAddOn] = [
        .init(id: UUID(), name: "Story screenshot proof", priceCents: 3900),
        .init(id: UUID(), name: "Rush launch (24h)", priceCents: 9900)
    ]

    static let missions: [Mission] = [
        Mission(
            id: UUID(),
            title: "Help boost this skincare reel",
            brandName: "Glow Skincare",
            description: "Complete the Spark Run steps to boost engagement.",
            totalReward: 60,
            actions: [
                .init(id: UUID(), title: "Watch the reel", coinReward: 5, isCompleted: false),
                .init(id: UUID(), title: "Like or save", coinReward: 5, isCompleted: false),
                .init(id: UUID(), title: "Leave a thoughtful comment", coinReward: 15, isCompleted: false),
                .init(id: UUID(), title: "Share to story", coinReward: 25, isCompleted: false),
                .init(id: UUID(), title: "Click brand profile", coinReward: 10, isCompleted: false)
            ],
            status: .available
        ),
        Mission(
            id: UUID(),
            title: "Boost a summer product post",
            brandName: "SunSkin Co",
            description: "Drive engagement with a guided action list.",
            totalReward: 45,
            actions: [
                .init(id: UUID(), title: "Watch post", coinReward: 5, isCompleted: false),
                .init(id: UUID(), title: "Like post", coinReward: 5, isCompleted: false),
                .init(id: UUID(), title: "Comment with takeaway", coinReward: 15, isCompleted: false),
                .init(id: UUID(), title: "Visit profile", coinReward: 20, isCompleted: false)
            ],
            status: .available
        )
    ]

    static let campaigns: [Campaign] = [
        .init(
            id: UUID(),
            title: "Summer Glow Campaign",
            platform: "Instagram",
            missionCount: 75,
            completedMissionCount: 29,
            status: .active,
            package: packages[1],
            addOns: addOns
        ),
        .init(
            id: UUID(),
            title: "Back to School Launch",
            platform: "TikTok",
            missionCount: 25,
            completedMissionCount: 8,
            status: .draft,
            package: packages[0],
            addOns: []
        )
    ]

    static let coinSettings = SparkCoinSettings(coinsPerDollar: 100, minimumCashoutCoins: 1000, reviewMessage: "Status: Pending Review")
    static let appSettings = AppSettings(missionDailyLimit: 5, autoApproveProofs: false, maintenanceMode: false)
}
