import SwiftUI

struct SparkRunView: View {
    @Binding var mission: Mission
    @Binding var showSparkRun: Bool
    @State private var currentActionIndex = 0
    @State private var coinsEarned = 0
    @State private var showCompletion = false
    
    var currentAction: MissionAction {
        mission.requiredActions[currentActionIndex]
    }
    
    var isLastAction: Bool {
        currentActionIndex == mission.requiredActions.count - 1
    }
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            if showCompletion {
                SparkRunCompletionView(coinsEarned: coinsEarned, showSparkRun: $showSparkRun)
            } else {
                VStack(spacing: 0) {
                    HStack {
                        Button(action: { showSparkRun = false }) {
                            Image(systemName: "xmark")
                                .foregroundColor(AppColors.textMuted)
                        }
                        Spacer()
                        Text("Spark Run")
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.textPrimary)
                        Spacer()
                        Text("\(currentActionIndex + 1)/\(mission.requiredActions.count)")
                            .font(.caption)
                            .foregroundColor(AppColors.textMuted)
                    }
                    .padding()
                    
                    SparkProgressBar(progress: Double(currentActionIndex + 1) / Double(mission.requiredActions.count))
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    ScrollView {
                        VStack(spacing: 24) {
                            VStack(spacing: 16) {
                                Image(systemName: currentAction.icon)
                                    .font(.system(size: 60))
                                    .foregroundColor(AppColors.primaryAccent)
                                
                                Text(currentAction.description)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .multilineTextAlignment(.center)
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Reward for this step")
                                            .font(.caption)
                                            .foregroundColor(AppColors.textMuted)
                                        HStack(spacing: 4) {
                                            Image(systemName: "bolt.fill")
                                                .foregroundColor(AppColors.primaryAccent)
                                            Text("\(currentAction.coinReward)")
                                                .font(.system(size: 32, weight: .bold))
                                        }
                                        .foregroundColor(AppColors.textPrimary)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Cash value")
                                            .font(.caption)
                                            .foregroundColor(AppColors.textMuted)
                                        Text("$\(String(format: "%.2f", Double(currentAction.coinReward) / 100.0))")
                                            .font(.headline)
                                            .foregroundColor(AppColors.primaryAccent)
                                    }
                                }
                                
                                if currentAction.requiresProof {
                                    HStack(spacing: 8) {
                                        Image(systemName: "camera.fill")
                                            .font(.system(size: 12))
                                        Text("Screenshot proof required")
                                            .font(.caption)
                                    }
                                    .foregroundColor(AppColors.warningColor)
                                    .padding()
                                    .background(AppColors.warningColor.opacity(0.1))
                                    .cornerRadius(8)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(AppColors.cardBackground)
                            .cornerRadius(12)
                        }
                        .padding()
                    }
                    
                    VStack(spacing: 12) {
                        Button(action: completeAction) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Mark Complete")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColors.successColor)
                            .foregroundColor(AppColors.primaryBackground)
                            .cornerRadius(12)
                        }
                        
                        Button(action: { showSparkRun = false }) {
                            Text("Save for Later")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppColors.cardBackground)
                                .foregroundColor(AppColors.textMuted)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    private func completeAction() {
        var updatedAction = mission.requiredActions[currentActionIndex]
        updatedAction.completed = true
        mission.requiredActions[currentActionIndex] = updatedAction
        coinsEarned += currentAction.coinReward
        
        if isLastAction {
            showCompletion = true
        } else {
            currentActionIndex += 1
        }
    }
}

struct SparkRunCompletionView: View {
    let coinsEarned: Int
    @Binding var showSparkRun: Bool
    @State private var animationScale = 0.5
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            VStack(spacing: 24) {
                Image(systemName: "sparkles")
                    .font(.system(size: 80))
                    .foregroundColor(AppColors.primaryAccent)
                    .scaleEffect(animationScale)
                
                VStack(spacing: 8) {
                    Text("Spark Run Complete!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.textPrimary)
                    
                    Text("Great work! Your proof is pending review.")
                        .font(.body)
                        .foregroundColor(AppColors.textMuted)
                        .multilineTextAlignment(.center)
                }
                
                VStack(alignment: .center, spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(AppColors.primaryAccent)
                        Text("\(coinsEarned)")
                            .font(.system(size: 48, weight: .bold))
                    }
                    .foregroundColor(AppColors.textPrimary)
                    
                    Text("$\(String(format: "%.2f", Double(coinsEarned) / 100.0))")
                        .font(.headline)
                        .foregroundColor(AppColors.primaryAccent)
                }
                .frame(maxWidth: .infinity)
                .padding(32)
                .background(AppColors.cardBackground)
                .cornerRadius(16)
            }
            
            Spacer()
            
            Button(action: { showSparkRun = false }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Back to Dashboard")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(AppColors.primaryAccent)
                .foregroundColor(AppColors.primaryBackground)
                .cornerRadius(12)
            }
        }
        .padding()
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                animationScale = 1.0
            }
        }
    }
}

#Preview {
    SparkRunView(mission: .constant(MockDataService.createMockMissions()[0]), showSparkRun: .constant(true))
}
