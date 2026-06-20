import SwiftUI

struct CampaignStatusView: View {
    @StateObject private var viewModel = BrandDashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.campaigns) { campaign in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(campaign.title)
                            .font(.headline)
                            .foregroundStyle(AppTheme.white)
                        Text("Platform: \(campaign.platform)")
                            .foregroundStyle(AppTheme.mutedGray)
                        Text("Status: \(campaign.status.rawValue)")
                            .foregroundStyle(AppTheme.sparkBlue)
                        Text("Missions: \(campaign.completedMissionCount)/\(campaign.missionCount)")
                            .foregroundStyle(AppTheme.mutedGray)
                        SparkProgressBar(progress: campaign.progress)
                    }
                    .padding()
                    .background(AppTheme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationTitle("Campaign Status")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
