import Foundation

struct AppUser: Identifiable, Codable {
    let id: String
    let email: String
    let fullName: String
    let accountType: AccountType
    let status: UserStatus
    let createdAt: Date
    let stripeCustomerId: String?
    let stripeConnectedAccountId: String?
    let profileImageUrl: String?
    
    enum AccountType: String, Codable {
        case creator
        case brand
        case admin
    }
    
    enum UserStatus: String, Codable {
        case pending
        case approved
        case rejected
        case suspended
    }
}
