import Foundation

struct CampaignAddOn: Identifiable, Hashable {
    let id: UUID
    let name: String
    let priceCents: Int
}
