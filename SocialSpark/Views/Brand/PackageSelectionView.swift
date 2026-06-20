import SwiftUI

struct PackageSelectionView: View {
    @StateObject private var viewModel = CreateCampaignViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.packages) { package in
                    PackageCard(package: package, selected: viewModel.selectedPackage?.id == package.id)
                        .onTapGesture { viewModel.selectedPackage = package }
                }
            }
            .padding()
        }
        .navigationTitle("Package Selection")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
