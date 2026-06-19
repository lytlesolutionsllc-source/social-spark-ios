import SwiftUI

struct AdminDashboardView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var appSettings = AppSettings()
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Admin Panel")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.textPrimary)
                    }
                    Spacer()
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(AppColors.primaryAccent)
                }
                .padding()
                
                Picker("Admin Tabs", selection: $selectedTab) {
                    Text("Users").tag(0)
                    Text("Reviews").tag(1)
                    Text("Settings").tag(2)
                }
                .pickerStyle(.segmented)
                .background(AppColors.cardBackground)
                .padding()
                
                if selectedTab == 0 {
                    AdminUsersView()
                } else if selectedTab == 1 {
                    AdminReviewsView()
                } else {
                    AdminSettingsView(settings: $appSettings)
                }
            }
        }
    }
}

struct AdminUsersView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Pending Approvals")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    
                    AdminUserCard(
                        name: "Sarah Martinez",
                        type: "Creator",
                        status: "Pending",
                        action1: "Approve",
                        action2: "Reject"
                    )
                    
                    AdminUserCard(
                        name: "Tech Startup Inc",
                        type: "Brand",
                        status: "Pending",
                        action1: "Approve",
                        action2: "Reject"
                    )
                }
                
                Divider()
                    .background(AppColors.cardBackground)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Flagged Users")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    
                    AdminUserCard(
                        name: "Unknown User",
                        type: "Creator",
                        status: "Flagged",
                        action1: "Investigate",
                        action2: "Suspend"
                    )
                }
            }
            .padding()
        }
    }
}

struct AdminUserCard: View {
    let name: String
    let type: String
    let status: String
    let action1: String
    let action2: String
    
    var statusColor: Color {
        switch status {
        case "Pending": return AppColors.warningColor
        case "Flagged": return AppColors.errorColor
        default: return AppColors.successColor
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    Text(type)
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
                Spacer()
                Text(status)
                    .font(.caption2)
                    .foregroundColor(statusColor)
                    .padding(6)
                    .background(statusColor.opacity(0.2))
                    .cornerRadius(4)
            }
            
            HStack(spacing: 8) {
                Button(action: {}) {
                    Text(action1)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(AppColors.successColor)
                        .foregroundColor(AppColors.primaryBackground)
                        .cornerRadius(6)
                }
                
                Button(action: {}) {
                    Text(action2)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(AppColors.errorColor)
                        .foregroundColor(AppColors.primaryBackground)
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

struct AdminReviewsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Pending Proof Review")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    
                    AdminProofCard(
                        creator: "Alex Creator",
                        mission: "Summer Glow Campaign",
                        coins: 60,
                        status: "Pending"
                    )
                    
                    AdminProofCard(
                        creator: "Jordan Designer",
                        mission: "App Launch Mission",
                        coins: 100,
                        status: "Pending"
                    )
                }
            }
            .padding()
        }
    }
}

struct AdminProofCard: View {
    let creator: String
    let mission: String
    let coins: Int
    let status: String
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(creator)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    Text(mission)
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
                Spacer()
                CoinBadge(coins: coins, showCash: false)
            }
            
            HStack(spacing: 8) {
                Button(action: {}) {
                    Text("Approve")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(AppColors.successColor)
                        .foregroundColor(AppColors.primaryBackground)
                        .cornerRadius(6)
                }
                
                Button(action: {}) {
                    Text("Reject")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(AppColors.errorColor)
                        .foregroundColor(AppColors.primaryBackground)
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

struct AdminSettingsView: View {
    @Binding var settings: AppSettings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Coin Settings")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    
                    SettingRow(
                        label: "Coins per Dollar",
                        value: "\(settings.coinsPerDollar)"
                    )
                    
                    SettingRow(
                        label: "Minimum Cashout",
                        value: "\(settings.minimumCashoutCoins) coins"
                    )
                }
                
                Divider()
                    .background(AppColors.cardBackground)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Creator Limits")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    
                    SettingRow(
                        label: "Max Missions/Day",
                        value: "\(settings.maxMissionsPerCreatorPerDay)"
                    )
                    
                    SettingRow(
                        label: "Min Comment Words",
                        value: "\(settings.minimumCommentWordCount)"
                    )
                }
                
                Divider()
                    .background(AppColors.cardBackground)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Moderation")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    
                    HStack {
                        Text("Manual Proof Review")
                            .foregroundColor(AppColors.textPrimary)
                        Spacer()
                        Toggle("", isOn: $settings.requireManualProofReview)
                            .tint(AppColors.primaryAccent)
                    }
                    .padding()
                    .background(AppColors.cardBackground)
                    .cornerRadius(8)
                    
                    HStack {
                        Text("Require Disclosure")
                            .foregroundColor(AppColors.textPrimary)
                        Spacer()
                        Toggle("", isOn: $settings.requireDisclosure)
                            .tint(AppColors.primaryAccent)
                    }
                    .padding()
                    .background(AppColors.cardBackground)
                    .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct SettingRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(AppColors.textPrimary)
            Spacer()
            Text(value)
                .font(.caption)
                .foregroundColor(AppColors.primaryAccent)
                .fontWeight(.semibold)
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(8)
    }
}

#Preview {
    AdminDashboardView()
        .environmentObject(AppState())
}
