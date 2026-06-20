import Foundation

final class AdminDashboardViewModel: ObservableObject {
    @Published var settings: AppSettings
    @Published var pendingProofs: [ProofSubmission]

    init(service: MockDataServing = MockDataService()) {
        self.settings = service.appSettings
        self.pendingProofs = [
            ProofSubmission(id: UUID(), missionID: UUID(), notes: "Comment + story proof uploaded", status: .pending),
            ProofSubmission(id: UUID(), missionID: UUID(), notes: "Profile click screenshot added", status: .pending)
        ]
    }
}
