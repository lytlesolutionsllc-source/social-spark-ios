import Foundation

struct CampaignPackage: Identifiable, Hashable {
    let id: UUID
    let name: String
    let missionsIncluded: Int
    let priceCents: Int
    let subtitle: String
}
