import SwiftUI

struct AvailableMissionsView: View {
    @ObservedObject var viewModel: CreatorViewModel

    var body: some View {
        VStack(spacing: 16) {
            Picker("Platform", selection: $viewModel.selectedFilter) {
                ForEach(CreatorViewModel.MissionFilter.allCases) { filter in
                    Text(filter.rawValue).tag(filter)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            if viewModel.visibleMissions.isEmpty {
                Spacer()
                Text("No missions match this filter right now.")
                    .foregroundColor(.gray)
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.visibleMissions) { mission in
                            NavigationLink(destination: MissionDetailView(viewModel: viewModel, mission: mission)) {
                                MissionCard(mission: mission)
                            }
                            .buttonStyle(.plain)
                            .padding(.horizontal)
                            .contextMenu {
                                Button(role: .destructive) {
                                    viewModel.markNotInterested(mission)
                                } label: {
                                    Label("Not Interested", systemImage: "eye.slash")
                                }
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle("Available Missions")
    }
}
