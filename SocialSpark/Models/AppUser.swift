import Foundation

struct AppUser: Identifiable, Hashable {
    let id: UUID
    let name: String
    let email: String
    let accountType: AccountType

    enum AccountType: String, CaseIterable, Hashable {
        case creator = "Creator"
        case brand = "Brand"
        case admin = "Admin"
    }
}
