import SwiftUI

struct SparkRunView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    @StateObject private var viewModel: SparkRunViewModel

    init(mission: Mission) {
        _viewModel = StateObject(wrappedValue: SparkRunViewModel(mission: mission))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.mission.title)
                    .font(.title3.bold())
                    .foregroundStyle(AppTheme.white)
                SparkProgressBar(progress: viewModel.progress)
                    .animation(.easeInOut(duration: 0.25), value: viewModel.progress)
                Text("\(viewModel.currentStep)/\(viewModel.steps.count) steps complete")
                    .foregroundStyle(AppTheme.mutedGray)

                ForEach(Array(viewModel.steps.enumerated()), id: \.element.id) { index, step in
                    HStack {
                        Image(systemName: index < viewModel.currentStep ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(index < viewModel.currentStep ? AppTheme.sparkBlue : AppTheme.mutedGray)
                        Text(step.title)
                            .foregroundStyle(AppTheme.white)
                        Spacer()
                        CoinBadge(coins: step.coinReward)
                    }
                    .padding()
                    .background(AppTheme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                if viewModel.completed {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Spark Run Complete")
                            .font(.title3.bold())
                            .foregroundStyle(AppTheme.electricYellow)
                        Text("You collected \(viewModel.collectedCoins) Spark Coins")
                            .foregroundStyle(AppTheme.white)
                        Text("Status: Pending Review")
                            .foregroundStyle(AppTheme.sparkBlue)
                    }
                    .padding()
                    .background(AppTheme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    SparkButton(title: "Submit Proof", icon: "square.and.arrow.up") {
                        appState.path.append(.proofSubmission(viewModel.mission))
                    }
                } else {
                    SparkButton(title: "Complete Next Step", icon: "checkmark") {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            viewModel.completeCurrentStep()
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Spark Run")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
