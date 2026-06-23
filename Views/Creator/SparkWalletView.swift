import SwiftUI

struct SparkWalletView: View {
    @ObservedObject var viewModel: CreatorViewModel
    @State private var showPayoutAlert = false

    var body: some View {
        VStack(spacing: 16) {
            EarningsCard(
                title: "Spark Wallet",
                coinAmount: viewModel.coinBalance,
                cashAmount: viewModel.cashBalance
            )
            .padding(.top, 8)

            Text(viewModel.payoutRuleText)
                .font(.footnote)
                .foregroundColor(.secondary)

            Button("Request Payout") {
                if viewModel.canRequestPayout {
                    showPayoutAlert = true
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.canRequestPayout)

            if !viewModel.canRequestPayout && !viewModel.payoutRequested {
                Text("You need at least $20.00 available to request a payout.")
                    .font(.footnote)
                    .foregroundColor(.red.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            if viewModel.payoutRequested {
                Text("Payout request submitted. Status: Processing (Mock)")
                    .font(.footnote)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Spark Wallet")
        .alert("Request Payout", isPresented: $showPayoutAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Confirm") {
                viewModel.requestPayout()
            }
        } message: {
            Text("Submit payout request for $\(viewModel.cashBalance, specifier: "%.2f")?")
        }
    }
}
