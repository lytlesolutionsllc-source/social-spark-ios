import SwiftUI

struct SparkWalletView: View {
    @StateObject private var viewModel = SparkWalletViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                EarningsCard(title: "Pending Coins", coins: viewModel.profile.pendingCoins)
                EarningsCard(title: "Approved Coins", coins: viewModel.profile.approvedCoins)
                EarningsCard(title: "Lifetime Coins", coins: viewModel.profile.lifetimeCoins)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conversion")
                        .font(.headline)
                        .foregroundStyle(AppTheme.white)
                    Text("100 Spark Coins = $1.00")
                        .foregroundStyle(AppTheme.mutedGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppTheme.card)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationTitle("Spark Wallet")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
