import SwiftUI

struct MissionDetailView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    let mission: Mission

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                Text(mission.title)
                    .font(.title3.bold())
                    .foregroundStyle(AppTheme.white)
                Text(mission.description)
                    .foregroundStyle(AppTheme.mutedGray)
                CoinBadge(coins: mission.totalReward)

                Text("Steps")
                    .font(.headline)
                    .foregroundStyle(AppTheme.white)

                ForEach(mission.actions) { action in
                    HStack {
                        Text(action.title)
                            .foregroundStyle(AppTheme.white)
                        Spacer()
                        CoinBadge(coins: action.coinReward)
                    }
                    .padding()
                    .background(AppTheme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                SparkButton(title: "Start Spark Run", icon: "play.fill") {
                    var missionInProgress = mission
                    missionInProgress.status = .inProgress
                    appState.path.append(.sparkRun(missionInProgress))
                }
            }
            .padding()
        }
        .navigationTitle("Mission Detail")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
