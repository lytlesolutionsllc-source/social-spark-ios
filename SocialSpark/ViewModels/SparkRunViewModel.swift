import Foundation

final class SparkRunViewModel: ObservableObject {
    @Published var mission: Mission
    @Published var currentStep = 0
    @Published var completed = false

    init(mission: Mission) {
        self.mission = mission
    }

    var steps: [MissionAction] { mission.actions }

    var progress: Double {
        guard !steps.isEmpty else { return 0 }
        return Double(currentStep) / Double(steps.count)
    }

    var collectedCoins: Int {
        Array(steps.prefix(currentStep)).reduce(0) { $0 + $1.coinReward }
    }

    func completeCurrentStep() {
        guard currentStep < steps.count else { return }
        currentStep += 1
        completed = currentStep == steps.count
    }
}
