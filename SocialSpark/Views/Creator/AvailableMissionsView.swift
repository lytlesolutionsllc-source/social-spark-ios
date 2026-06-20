import SwiftUI

struct AvailableMissionsView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    @StateObject private var viewModel = CreatorDashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.missions) { mission in
                    MissionCard(mission: mission)
                        .onTapGesture { appState.path.append(.missionDetail(mission)) }
                }
            }
            .padding()
        }
        .navigationTitle("Available Missions")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
