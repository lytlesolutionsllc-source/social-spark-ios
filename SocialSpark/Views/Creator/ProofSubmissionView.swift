import SwiftUI

struct ProofSubmissionView: View {
    @State private var notes = "Completed all required steps with authentic engagement."
    let mission: Mission

    var body: some View {
        Form {
            Section("Mission") {
                Text(mission.title)
                CoinBadge(coins: mission.totalReward)
            }

            Section("Submission Notes") {
                TextEditor(text: $notes)
                    .frame(minHeight: 120)
            }

            Section {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Submitted")
                        .fontWeight(.semibold)
                    Text("Status: Pending Review")
                        .foregroundStyle(AppTheme.sparkBlue)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(AppTheme.deepNavy)
        .navigationTitle("Proof Submission")
        .navigationBarTitleDisplayMode(.inline)
    }
}
