import SwiftUI

struct AdminDashboardView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    @StateObject private var viewModel = AdminDashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Admin Dashboard")
                    .font(.title2.bold())
                    .foregroundStyle(AppTheme.white)

                Text("Pending Proof Reviews")
                    .font(.headline)
                    .foregroundStyle(AppTheme.white)

                ForEach(viewModel.pendingProofs) { proof in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(proof.notes)
                            .foregroundStyle(AppTheme.white)
                        Text(proof.status.rawValue)
                            .font(.caption)
                            .foregroundStyle(AppTheme.sparkBlue)
                    }
                    .padding()
                    .background(AppTheme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                SparkButton(title: "Admin Settings", icon: "gearshape") {
                    appState.path.append(.adminSettings)
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
