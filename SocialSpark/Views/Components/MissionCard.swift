import SwiftUI

struct MissionCard: View {
    let mission: Mission

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(mission.brandName)
                        .font(.caption)
                        .foregroundStyle(AppTheme.mutedGray)
                    Text(mission.title)
                        .font(.headline)
                        .foregroundStyle(AppTheme.white)
                }
                Spacer()
                CoinBadge(coins: mission.totalReward)
            }

            Text(mission.description)
                .font(.subheadline)
                .foregroundStyle(AppTheme.mutedGray)

            SparkProgressBar(progress: mission.status == .available ? 0 : 0.45)
            Text(mission.status.rawValue)
                .font(.caption2)
                .foregroundStyle(AppTheme.sparkBlue)
        }
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
