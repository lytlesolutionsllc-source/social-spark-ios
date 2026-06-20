import SwiftUI

struct EarningsCard: View {
    let title: String
    let coins: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundStyle(AppTheme.mutedGray)
            Text("\(coins) Spark Coins")
                .font(.headline)
                .foregroundStyle(AppTheme.white)
            Text(String(format: "≈ $%.2f", Double(coins) / 100))
                .font(.caption)
                .foregroundStyle(AppTheme.sparkBlue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
