import SwiftUI

struct MissionDetailView: View {
    @ObservedObject var viewModel: CreatorViewModel
    let mission: Mission

    @Environment(\.dismiss) private var dismiss

    var currentMission: Mission {
        viewModel.missions.first(where: { $0.id == mission.id }) ?? mission
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(currentMission.brandName)
                        .font(.headline)
                    Text(currentMission.brandSnippet)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 14))

                Text(currentMission.title)
                    .font(.title3).bold()

                Text("\(currentMission.totalRewardCoins) Spark Coins")
                    .font(.subheadline)
                    .foregroundColor(.orange)

                VStack(alignment: .leading, spacing: 8) {
                    ForEach(currentMission.actions) { action in
                        HStack {
                            Text("• \(action.title)")
                            Spacer()
                            Text("+\(action.coinReward)")
                                .foregroundColor(.blue)
                        }
                    }
                }

                if !currentMission.hasOptedIn {
                    Button("Opt In to Mission") {
                        viewModel.optIn(to: currentMission)
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    NavigationLink("Start Spark Run", destination: SparkRunView(mission: currentMission))
                        .buttonStyle(.borderedProminent)
                }

                Button(role: .destructive) {
                    viewModel.markNotInterested(currentMission)
                    dismiss()
                } label: {
                    Text("Not Interested")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .navigationTitle("Mission Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
