import SwiftUI

struct MissionDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var mission: Mission
    @State private var currentActionIndex = 0
    @State private var showSparkRun = false
    
    init(mission: Mission) {
        _mission = State(initialValue: mission)
    }
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            if showSparkRun {
                SparkRunView(mission: $mission, showSparkRun: $showSparkRun)
            } else {
                VStack(spacing: 0) {
                    HStack {
                        Button(action: { dismiss() }) {
                            HStack(spacing: 6) {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            .foregroundColor(AppColors.primaryAccent)
                        }
                        Spacer()
                        Text("Mission Details")
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.textPrimary)
                        Spacer()
                        Image(systemName: "ellipsis")
                            .foregroundColor(AppColors.textMuted)
                    }
                    .padding()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(mission.brandName)
                                    .font(.caption)
                                    .foregroundColor(AppColors.textMuted)
                                Text(mission.campaignTitle)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(AppColors.textPrimary)
                                Text(mission.description)
                                    .font(.body)
                                    .foregroundColor(AppColors.textMuted)
                            }
                            
                            HStack(spacing: 16) {
                                CoinBadge(coins: mission.totalCoinReward, showCash: true)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Earn")
                                        .font(.caption2)
                                        .foregroundColor(AppColors.textMuted)
                                    Text("$\(String(format: "%.2f", Double(mission.totalCoinReward) / 100.0))")
                                        .font(.headline)
                                        .foregroundColor(AppColors.primaryAccent)
                                }
                                Spacer()
                            }
                            
                            Divider()
                                .background(AppColors.cardBackground)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Mission Steps")
                                    .font(.headline)
                                    .foregroundColor(AppColors.textPrimary)
                                
                                ForEach(Array(mission.requiredActions.enumerated()), id: \.offset) { index, action in
                                    MissionStepCard(step: index + 1, action: action)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Button(action: { showSparkRun = true }) {
                        HStack {
                            Image(systemName: "bolt.fill")
                            Text("Start Spark Run")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(AppColors.primaryAccent)
                        .foregroundColor(AppColors.primaryBackground)
                        .cornerRadius(12)
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct MissionStepCard: View {
    let step: Int
    let action: MissionAction
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .center, spacing: 0) {
                Text("\(step)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.primaryBackground)
                    .frame(width: 24, height: 24)
                    .background(AppColors.primaryAccent)
                    .cornerRadius(12)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(action.description)
                    .font(.body)
                    .foregroundColor(AppColors.textPrimary)
                HStack {
                    Image(systemName: "bolt.fill")
                        .font(.caption)
                        .foregroundColor(AppColors.primaryAccent)
                    Text("\(action.coinReward) coins")
                        .font(.caption2)
                        .foregroundColor(AppColors.textMuted)
                }
            }
            Spacer()
            if action.requiresProof {
                Image(systemName: "camera.fill")
                    .foregroundColor(AppColors.textMuted)
                    .font(.system(size: 14))
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        MissionDetailView(mission: MockDataService.createMockMissions()[0])
    }
}
