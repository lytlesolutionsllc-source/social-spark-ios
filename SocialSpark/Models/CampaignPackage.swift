import Foundation

enum CampaignPackage: Codable {
    case starterSpark
    case growthBoost
    case viralWave
    case launchStorm
    
    var name: String {
        switch self {
        case .starterSpark: return "Starter Spark"
        case .growthBoost: return "Growth Boost"
        case .viralWave: return "Viral Wave"
        case .launchStorm: return "Launch Storm"
        }
    }
    
    var price: Int {
        switch self {
        case .starterSpark: return 9900
        case .growthBoost: return 24900
        case .viralWave: return 49900
        case .launchStorm: return 119900
        }
    }
    
    var missions: Int {
        switch self {
        case .starterSpark: return 50
        case .growthBoost: return 150
        case .viralWave: return 300
        case .launchStorm: return 750
        }
    }
    
    var description: String {
        switch self {
        case .starterSpark: return "Testing one reel"
        case .growthBoost: return "Getting visible traction"
        case .viralWave: return "Product launches or promos"
        case .launchStorm: return "Larger brand campaigns"
        }
    }
}
