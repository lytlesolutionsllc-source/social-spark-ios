import SwiftUI

struct CoinBadge: View {
    let coins: Int
    let showCash: Bool
    
    var cashValue: String {
        String(format: "$%.2f", Double(coins) / 100.0)
    }
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "bolt.fill")
                .font(.system(size: 14, weight: .semibold))
            Text("\(coins)")
                .font(.system(size: 16, weight: .semibold))
            if showCash {
                Text(cashValue)
                    .font(.caption)
                    .foregroundColor(AppColors.textMuted)
            }
        }
        .foregroundColor(AppColors.primaryAccent)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(AppColors.cardBackground)
        .cornerRadius(8)
    }
}

#Preview {
    VStack(spacing: 12) {
        CoinBadge(coins: 60, showCash: true)
        CoinBadge(coins: 1250, showCash: true)
    }
    .padding()
    .background(AppColors.primaryBackground)
}
