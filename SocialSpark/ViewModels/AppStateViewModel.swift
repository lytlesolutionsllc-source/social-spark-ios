import Foundation

enum AppRoute {
    case welcome
    case accountTypePicker
    case creator
    case brand
    case admin
}

enum AppDestination: Hashable {
    case availableMissions
    case missionDetail(Mission)
    case sparkRun(Mission)
    case proofSubmission(Mission)
    case sparkWallet
    case createCampaign
    case packageSelection
    case campaignStatus
    case adminSettings
}

final class AppStateViewModel: ObservableObject {
    @Published var route: AppRoute = .welcome
    @Published var selectedAccountType: AppUser.AccountType?
    @Published var path: [AppDestination] = []

    func goToAccountTypePicker() {
        route = .accountTypePicker
        path.removeAll()
    }

    func chooseAccountType(_ type: AppUser.AccountType) {
        selectedAccountType = type
        path.removeAll()
        switch type {
        case .creator: route = .creator
        case .brand: route = .brand
        case .admin: route = .admin
        }
    }

    func reset() {
        selectedAccountType = nil
        route = .welcome
        path.removeAll()
    }
}
