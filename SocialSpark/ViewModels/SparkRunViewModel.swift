import Foundation

final class SparkRunViewModel: ObservableObject {
    @Published var mission: Mission
    @Published var currentStep = 0
    @Published var completed = false

    init(mission: Mission) {
        self.mission = mission
        self.currentStep = mission.actions.filter(\.isCompleted).count
        self.completed = self.currentStep == mission.actions.count && !mission.actions.isEmpty

        if !self.completed && self.mission.status == .available {
            self.mission.status = .inProgress
        }
    }

    var steps: [MissionAction] { mission.actions }

    var progress: Double {
        guard !steps.isEmpty else { return 0 }
        return Double(currentStep) / Double(steps.count)
    }

    var collectedCoins: Int {
        steps.filter(\.isCompleted).reduce(0) { $0 + $1.coinReward }
    }

    func completeCurrentStep() {
        guard currentStep < steps.count else { return }
        mission.actions[currentStep].isCompleted = true
        currentStep += 1
        completed = currentStep == steps.count
        mission.status = completed ? .pendingReview : .inProgress
    }
}
