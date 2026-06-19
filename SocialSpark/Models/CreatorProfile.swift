import Foundation

struct CreatorProfile: Identifiable, Codable {
    let id: String
    let userId: String
    let displayName: String
    let niches: [String]
    let socialHandles: [String: String]
    let qualityScore: Int
    let creatorLevel: CreatorLevel
    let completedMissions: Int
    let rejectedMissions: Int
    let pendingCoins: Int
    let approvedCoins: Int
    let paidCoins: Int
    let stripeOnboardingComplete: Bool
    let agreedToDisclosureRules: Bool
    
    enum CreatorLevel: String, Codable {
        case newSpark = "New Spark"
        case trustedSpark = "Trusted Spark"
        case powerSpark = "Power Spark"
        case brandFavorite = "Brand Favorite"
        case sparkElite = "Spark Elite"
        
        var minMissions: Int {
            switch self {
            case .newSpark: return 0
            case .trustedSpark: return 10
            case .powerSpark: return 50
            case .brandFavorite: return 100
            case .sparkElite: return Int.max
            }
        }
        
        var benefits: String {
            switch self {
            case .newSpark: return "Basic missions"
            case .trustedSpark: return "More missions per day"
            case .powerSpark: return "Higher-paying missions"
            case .brandFavorite: return "Priority campaign access"
            case .sparkElite: return "Premium campaigns"
            }
        }
    }
    
    var cashValue: Double {
        Double(approvedCoins) / 100.0
    }
    
    var pendingCashValue: Double {
        Double(pendingCoins) / 100.0
    }
}
