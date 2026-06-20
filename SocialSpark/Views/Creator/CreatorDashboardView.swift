import SwiftUI

struct CreatorDashboardView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    @StateObject private var viewModel = CreatorDashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Creator Dashboard")
                            .font(.title2.bold())
                            .foregroundStyle(AppTheme.white)
                        Text(viewModel.profile.username)
                            .foregroundStyle(AppTheme.mutedGray)
                    }
                    Spacer()
                    LevelBadge(level: viewModel.profile.level)
                }

                HStack(spacing: 12) {
                    EarningsCard(title: "Pending", coins: viewModel.profile.pendingCoins)
                    EarningsCard(title: "Approved", coins: viewModel.profile.approvedCoins)
                }

                SparkButton(title: "Available Missions", icon: "list.bullet") {
                    appState.path.append(.availableMissions)
                }
                SparkButton(title: "Spark Wallet", icon: "wallet.pass") {
                    appState.path.append(.sparkWallet)
                }

                Text("Featured Mission")
                    .font(.headline)
                    .foregroundStyle(AppTheme.white)

                if let mission = viewModel.missions.first {
                    MissionCard(mission: mission)
                        .onTapGesture { appState.path.append(.missionDetail(mission)) }
                }

                SparkButton(title: "Switch Account", style: .secondary) {
                    appState.goToAccountTypePicker()
                }
            }
            .padding()
        }
        .background(AppTheme.deepNavy.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}
