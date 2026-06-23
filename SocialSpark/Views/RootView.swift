import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appState: AppStateViewModel

    var body: some View {
        NavigationStack(path: $appState.path) {
            ZStack {
                Color(red: 9/255, green: 13/255, blue: 26/255)
                    .ignoresSafeArea()

                switch appState.route {
                case .welcome:
                    WelcomeView()
                case .accountTypePicker:
                    AccountTypePickerView()
                case .creator:
                    CreatorDashboardView()
                case .brand:
                    BrandDashboardView()
                case .admin:
                    AdminDashboardView()
                }
            }
            .navigationDestination(for: AppDestination.self) { destination in
                switch destination {
                case .availableMissions:
                    AvailableMissionsView()
                case .missionDetail(let mission):
                    MissionDetailView(mission: mission)
                case .sparkRun(let mission):
                    SparkRunView(mission: mission)
                case .proofSubmission(let mission):
                    ProofSubmissionView(mission: mission)
                case .sparkWallet:
                    SparkWalletView()
                case .createCampaign:
                    CreateCampaignView()
                case .packageSelection:
                    PackageSelectionView()
                case .campaignStatus:
                    CampaignStatusView()
                case .adminSettings:
                    AdminSettingsView()
                }
            }
        }
    }
}
