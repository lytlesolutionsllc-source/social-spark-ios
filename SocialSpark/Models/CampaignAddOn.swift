import Foundation

struct CampaignAddOn: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let priceCents: Int
    
    static let allAddOns: [CampaignAddOn] = [
        .init(id: "1", name: "Extra 50 missions", description: "", priceCents: 8900),
        .init(id: "2", name: "Extra 100 missions", description: "", priceCents: 15900),
        .init(id: "3", name: "Require 10+ word comments", description: "", priceCents: 4900),
        .init(id: "4", name: "Require story screenshot", description: "", priceCents: 3900),
        .init(id: "5", name: "Beauty creator targeting", description: "", priceCents: 9900),
        .init(id: "6", name: "Mom creator targeting", description: "", priceCents: 9900),
        .init(id: "7", name: "Local city/state targeting", description: "", priceCents: 14900),
        .init(id: "8", name: "24-hour rush campaign", description: "", priceCents: 9900),
        .init(id: "9", name: "Profile click boost", description: "", priceCents: 7500),
        .init(id: "10", name: "Campaign report PDF", description: "", priceCents: 4900),
        .init(id: "11", name: "White-glove setup", description: "", priceCents: 19900)
    ]
}
