import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appState: AppStateViewModel

    var body: some View {
        NavigationStack(path: $appState.path) {
            Group {
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
            .background(AppTheme.deepNavy.ignoresSafeArea())
            .navigationDestination(for: AppDestination.self) { destination in
                destinationView(destination)
            }
        }
        .tint(AppTheme.electricYellow)
    }

    @ViewBuilder
    private func destinationView(_ destination: AppDestination) -> some View {
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
            CreateCampaignFlowView()
        case .packageSelection:
            PackageSelectionView()
        case .campaignStatus:
            CampaignStatusView()
        case .adminSettings:
            AdminSettingsView()
        }
    }
}
