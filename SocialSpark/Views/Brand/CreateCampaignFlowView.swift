import SwiftUI

struct CreateCampaignFlowView: View {
    @StateObject private var viewModel = CreateCampaignViewModel()

    var body: some View {
        Form {
            Section("Campaign Basics") {
                TextField("Campaign title", text: $viewModel.campaignTitle)
                Picker("Platform", selection: $viewModel.platform) {
                    ForEach(viewModel.platforms, id: \.self) { platform in
                        Text(platform).tag(platform)
                    }
                }
            }

            Section("Selected Package") {
                Text(viewModel.selectedPackage?.name ?? "None")
                Text(viewModel.selectedPackage.map { String(format: "$%.2f", Double($0.priceCents) / 100) } ?? "")
                    .foregroundStyle(AppTheme.mutedGray)
            }

            Section("Flow Status") {
                Text("Step 1: Campaign info")
                Text("Step 2: Package")
                Text("Step 3: Review")
            }
        }
        .navigationTitle("Create Campaign")
        .navigationBarTitleDisplayMode(.inline)
    }
}
