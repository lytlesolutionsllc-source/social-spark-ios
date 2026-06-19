import SwiftUI

struct CreatorDashboardView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var missions = MockDataService.createMockMissions()
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                CreatorHeaderView(profile: appState.creatorProfile)
                    .padding()
                
                Picker("Creator Tabs", selection: $selectedTab) {
                    Text("Missions").tag(0)
                    Text("Wallet").tag(1)
                    Text("Profile").tag(2)
                }
                .pickerStyle(.segmented)
                .background(AppColors.cardBackground)
                .padding()
                
                if selectedTab == 0 {
                    CreatorMissionsView(missions: missions)
                } else if selectedTab == 1 {
                    CreatorWalletView(profile: appState.creatorProfile ?? MockDataService.createMockCreator().1)
                } else {
                    CreatorProfileView(profile: appState.creatorProfile ?? MockDataService.createMockCreator().1)
                }
            }
        }
    }
}

struct CreatorHeaderView: View {
    let profile: CreatorProfile?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Welcome back")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    Text(profile?.displayName ?? "Creator")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.textPrimary)
                }
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(AppColors.primaryAccent)
            }
            
            if let profile = profile {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Quality Score")
                            .font(.caption2)
                            .foregroundColor(AppColors.textMuted)
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(AppColors.primaryAccent)
                            Text("\(profile.qualityScore)/100")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(AppColors.textPrimary)
                    }
                    Spacer()
                    LevelBadge(level: profile.creatorLevel)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

struct CreatorMissionsView: View {
    let missions: [Mission]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(missions) { mission in
                    NavigationLink(destination: MissionDetailView(mission: mission)) {
                        MissionCard(mission: mission)
                    }
                }
            }
            .padding()
        }
    }
}

struct CreatorWalletView: View {
    let profile: CreatorProfile
    @State private var showPayoutSheet = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                EarningsCard(title: "Pending", coins: profile.pendingCoins, icon: "hourglass.end", color: AppColors.primaryAccent)
                EarningsCard(title: "Approved", coins: profile.approvedCoins, icon: "checkmark.circle", color: AppColors.successColor)
                EarningsCard(title: "Paid", coins: profile.paidCoins, icon: "banknote", color: AppColors.secondaryAccent)
                
                Divider()
                    .padding(.vertical, 8)
                
                Button(action: { showPayoutSheet = true }) {
                    HStack {
                        Image(systemName: "arrow.up")
                        Text("Request Payout")
                        Spacer()
                        Text("$\(String(format: "%.2f", profile.cashValue))")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColors.primaryAccent)
                    .foregroundColor(AppColors.primaryBackground)
                    .cornerRadius(12)
                }
                .padding(.top, 8)
                .disabled(profile.approvedCoins < 1000)
                .opacity(profile.approvedCoins < 1000 ? 0.5 : 1.0)
            }
            .padding()
        }
    }
}

struct CreatorProfileView: View {
    let profile: CreatorProfile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Display Name")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    Text(profile.displayName)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Niches")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    HStack {
                        ForEach(profile.niches, id: \.self) { niche in
                            Text(niche)
                                .font(.caption2)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(AppColors.primaryAccent.opacity(0.2))
                                .cornerRadius(6)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Stats")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    HStack {
                        StatItem(label: "Completed", value: "\(profile.completedMissions)")
                        StatItem(label: "Rejected", value: "\(profile.rejectedMissions)")
                        StatItem(label: "Score", value: "\(profile.qualityScore)")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(12)
            }
            .padding()
        }
    }
}

struct StatItem: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headline)
                .foregroundColor(AppColors.primaryAccent)
            Text(label)
                .font(.caption2)
                .foregroundColor(AppColors.textMuted)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        CreatorDashboardView()
            .environmentObject(AppState())
    }
}
