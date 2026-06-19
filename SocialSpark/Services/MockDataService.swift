import Foundation

class MockDataService {
    static func createMockCreator() -> (AppUser, CreatorProfile) {
        let user = AppUser(
            id: "creator_1",
            email: "creator@socialspark.com",
            fullName: "Alex Creator",
            accountType: .creator,
            status: .approved,
            createdAt: Date().addingTimeInterval(-86400 * 30),
            stripeCustomerId: nil,
            stripeConnectedAccountId: nil,
            profileImageUrl: nil
        )
        
        let profile = CreatorProfile(
            id: "profile_1",
            userId: user.id,
            displayName: "@AlexCreator",
            niches: ["Beauty", "Lifestyle", "Fashion"],
            socialHandles: [
                "instagram": "@AlexCreator",
                "tiktok": "@AlexCreator",
                "youtube": "@AlexCreatorVlogs"
            ],
            qualityScore: 87,
            creatorLevel: .trustedSpark,
            completedMissions: 23,
            rejectedMissions: 2,
            pendingCoins: 450,
            approvedCoins: 1250,
            paidCoins: 5000,
            stripeOnboardingComplete: false,
            agreedToDisclosureRules: true
        )
        
        return (user, profile)
    }
    
    static func createMockBrand() -> (AppUser, BrandProfile) {
        let user = AppUser(
            id: "brand_1",
            email: "brand@skincare.com",
            fullName: "Glow Skincare Inc",
            accountType: .brand,
            status: .approved,
            createdAt: Date().addingTimeInterval(-86400 * 60),
            stripeCustomerId: "cus_mock123",
            stripeConnectedAccountId: nil,
            profileImageUrl: nil
        )
        
        let profile = BrandProfile(
            id: "brand_profile_1",
            userId: user.id,
            brandName: "Glow Skincare",
            websiteUrl: "https://glowskincare.com",
            industry: "Beauty & Skincare",
            logoUrl: nil,
            stripeCustomerId: "cus_mock123",
            approved: true
        )
        
        return (user, profile)
    }
    
    static func createMockAdmin() -> AppUser {
        AppUser(
            id: "admin_1",
            email: "admin@socialspark.com",
            fullName: "Admin User",
            accountType: .admin,
            status: .approved,
            createdAt: Date().addingTimeInterval(-86400 * 365),
            stripeCustomerId: nil,
            stripeConnectedAccountId: nil,
            profileImageUrl: nil
        )
    }
    
    static func createMockMissions() -> [Mission] {
        [
            Mission(
                id: "mission_1",
                campaignId: "campaign_1",
                creatorId: nil,
                brandId: "brand_1",
                status: .available,
                totalCoinReward: 60,
                requiredActions: [
                    MissionAction(id: "1", type: .watchReel, coinReward: 5, requiresProof: false, description: "Watch the reel", icon: "film"),
                    MissionAction(id: "2", type: .likeOrSave, coinReward: 5, requiresProof: true, description: "Like or save the post", icon: "heart"),
                    MissionAction(id: "3", type: .thoughtfulComment, coinReward: 15, requiresProof: true, description: "Leave a thoughtful comment", icon: "bubble.right"),
                    MissionAction(id: "4", type: .storyShare, coinReward: 25, requiresProof: true, description: "Share to your story", icon: "square.and.arrow.up"),
                    MissionAction(id: "5", type: .profileClick, coinReward: 10, requiresProof: false, description: "Click the brand profile", icon: "person.crop.circle")
                ],
                proofSubmission: nil,
                assignedAt: nil,
                submittedAt: nil,
                reviewedAt: nil,
                paidAt: nil,
                brandName: "Glow Skincare",
                campaignTitle: "Summer Glow Campaign",
                description: "Help boost our new skincare reel"
            ),
            Mission(
                id: "mission_2",
                campaignId: "campaign_2",
                creatorId: nil,
                brandId: "brand_1",
                status: .available,
                totalCoinReward: 100,
                requiredActions: [
                    MissionAction(id: "1", type: .watchReel, coinReward: 5, requiresProof: false, description: "Watch the reel", icon: "film"),
                    MissionAction(id: "2", type: .appDownload, coinReward: 95, requiresProof: true, description: "Download the app", icon: "arrow.down.app")
                ],
                proofSubmission: nil,
                assignedAt: nil,
                submittedAt: nil,
                reviewedAt: nil,
                paidAt: nil,
                brandName: "Tech Startup",
                campaignTitle: "App Launch Mission",
                description: "Download and rate our new app"
            )
        ]
    }
    
    static func createMockCampaigns() -> [Campaign] {
        [
            Campaign(
                id: "campaign_1",
                brandId: "brand_1",
                title: "Summer Glow Campaign",
                campaignUrl: "https://instagram.com/glowskincare/p/abc123",
                platform: "Instagram",
                goal: .boostEngagement,
                packageType: .growthBoost,
                missionCount: 150,
                completedMissionCount: 45,
                pricePaidCents: 24900,
                creatorPayoutPerMissionCoins: 60,
                campaignStatus: .live,
                targeting: CampaignTargeting(
                    niches: ["Beauty", "Skincare", "Lifestyle"],
                    minFollowers: 5000,
                    maxFollowers: 500000,
                    locations: ["US", "CA"],
                    ageRange: (18, 45)
                ),
                addOns: [],
                disclosureRequired: true,
                createdAt: Date().addingTimeInterval(-86400 * 5),
                startDate: Date().addingTimeInterval(-86400 * 2),
                endDate: Date().addingTimeInterval(86400 * 13)
            )
        ]
    }
}
