import Foundation

struct BrandProfile: Identifiable, Codable {
    let id: String
    let userId: String
    let brandName: String
    let websiteUrl: String
    let industry: String
    let logoUrl: String?
    let stripeCustomerId: String?
    let approved: Bool
}
