import SwiftUI

struct MissionCard: View {
    let mission: Mission
    var onTap: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mission.brandName)
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    Text(mission.campaignTitle)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(AppColors.primaryAccent)
                        Text("\(mission.totalCoinReward)")
                            .font(.headline)
                    }
                    .foregroundColor(AppColors.textPrimary)
                    Text("$\(String(format: "%.2f", Double(mission.totalCoinReward) / 100.0))")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
            }
            
            Text(mission.description)
                .font(.caption)
                .foregroundColor(AppColors.textMuted)
                .lineLimit(2)
            
            SparkProgressBar(progress: mission.progress)
            
            HStack {
                Text("\(mission.totalActions) steps")
                    .font(.caption2)
                    .foregroundColor(AppColors.textMuted)
                Spacer()
                if mission.status == .available {
                    Text("Available")
                        .font(.caption2)
                        .foregroundColor(AppColors.successColor)
                } else if mission.status == .accepted {
                    Text("In Progress")
                        .font(.caption2)
                        .foregroundColor(AppColors.primaryAccent)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
        .onTapGesture(perform: onTap)
    }
}

#Preview {
    MissionCard(mission: MockDataService.createMockMissions()[0])
        .padding()
        .background(AppColors.primaryBackground)
}
