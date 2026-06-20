import SwiftUI

struct CoinBadge: View {
    let coins: Int

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "bolt.fill")
            Text("\(coins) Coins")
                .fontWeight(.semibold)
        }
        .font(.caption)
        .foregroundStyle(AppTheme.electricYellow)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(AppTheme.card)
        .clipShape(Capsule())
    }
}
