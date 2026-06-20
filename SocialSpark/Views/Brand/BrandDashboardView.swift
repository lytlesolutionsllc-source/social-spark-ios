import SwiftUI

struct BrandDashboardView: View {
    @EnvironmentObject private var appState: AppStateViewModel
    @StateObject private var viewModel = BrandDashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Brand Dashboard")
                    .font(.title2.bold())
                    .foregroundStyle(AppTheme.white)
                Text(viewModel.profile.brandName)
                    .foregroundStyle(AppTheme.mutedGray)

                SparkButton(title: "Create Campaign", icon: "plus") {
                    appState.path.append(.createCampaign)
                }
                SparkButton(title: "Package Selection", icon: "shippingbox") {
                    appState.path.append(.packageSelection)
                }
                SparkButton(title: "Campaign Status", icon: "chart.bar") {
                    appState.path.append(.campaignStatus)
                }

                Text("Active Campaigns")
                    .font(.headline)
                    .foregroundStyle(AppTheme.white)

                ForEach(viewModel.campaigns) { campaign in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(campaign.title)
                            .foregroundStyle(AppTheme.white)
                        Text(campaign.status.rawValue)
                            .font(.caption)
                            .foregroundStyle(AppTheme.sparkBlue)
                        SparkProgressBar(progress: campaign.progress)
                    }
                    .padding()
                    .background(AppTheme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
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
