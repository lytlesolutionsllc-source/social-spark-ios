import SwiftUI

struct BrandDashboardView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var showCreateCampaign = false
    @State private var campaigns = MockDataService.createMockCampaigns()
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Brand Dashboard")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.textPrimary)
                        Text(appState.brandProfile?.brandName ?? "Brand")
                            .font(.caption)
                            .foregroundColor(AppColors.textMuted)
                    }
                    Spacer()
                    Button(action: { showCreateCampaign = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppColors.primaryAccent)
                    }
                }
                .padding()
                
                Picker("Brand Tabs", selection: $selectedTab) {
                    Text("Campaigns").tag(0)
                    Text("Analytics").tag(1)
                    Text("Settings").tag(2)
                }
                .pickerStyle(.segmented)
                .background(AppColors.cardBackground)
                .padding()
                
                if selectedTab == 0 {
                    BrandCampaignsView(campaigns: campaigns, showCreateCampaign: $showCreateCampaign)
                } else if selectedTab == 1 {
                    BrandAnalyticsView(campaigns: campaigns)
                } else {
                    BrandSettingsView(profile: appState.brandProfile)
                }
            }
        }
        .sheet(isPresented: $showCreateCampaign) {
            CreateCampaignView()
        }
    }
}

struct BrandCampaignsView: View {
    let campaigns: [Campaign]
    @Binding var showCreateCampaign: Bool
    
    var body: some View {
        if campaigns.isEmpty {
            ScrollView {
                VStack(spacing: 16) {
                    Image(systemName: "megaphone.fill")
                        .font(.system(size: 60))
                        .foregroundColor(AppColors.textMuted)
                    Text("No Campaigns Yet")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    Text("Launch your first creator mission")
                        .font(.body)
                        .foregroundColor(AppColors.textMuted)
                    Button(action: { showCreateCampaign = true }) {
                        Text("Create Campaign")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColors.primaryAccent)
                            .foregroundColor(AppColors.primaryBackground)
                            .cornerRadius(12)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .padding()
            }
        } else {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(campaigns) { campaign in
                        CampaignStatusCard(campaign: campaign)
                    }
                }
                .padding()
            }
        }
    }
}

struct CampaignStatusCard: View {
    let campaign: Campaign
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(campaign.title)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    Text(campaign.platform)
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text(campaign.campaignStatus.rawValue)
                        .font(.caption)
                        .foregroundColor(campaign.campaignStatus == .live ? AppColors.successColor : AppColors.textMuted)
                    Text("\(campaign.completedMissionCount)/\(campaign.missionCount)")
                        .font(.caption2)
                        .foregroundColor(AppColors.textMuted)
                }
            }
            
            SparkProgressBar(progress: campaign.progress)
            
            HStack {
                Text("Paid to creators")
                    .font(.caption2)
                    .foregroundColor(AppColors.textMuted)
                Spacer()
                Text("$\(String(format: "%.2f", Double(campaign.pricePaidCents) / 100.0))")
                    .font(.caption2)
                    .foregroundColor(AppColors.primaryAccent)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

struct BrandAnalyticsView: View {
    let campaigns: [Campaign]
    
    var totalSpent: Int {
        campaigns.reduce(0) { $0 + $1.pricePaidCents }
    }
    
    var totalMissions: Int {
        campaigns.reduce(0) { $0 + $1.completedMissionCount }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Total Spent")
                            .font(.caption2)
                            .foregroundColor(AppColors.textMuted)
                        Text("$\(String(format: "%.2f", Double(totalSpent) / 100.0))")
                            .font(.headline)
                            .foregroundColor(AppColors.textPrimary)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Missions Completed")
                            .font(.caption2)
                            .foregroundColor(AppColors.textMuted)
                        Text("\(totalMissions)")
                            .font(.headline)
                            .foregroundColor(AppColors.textPrimary)
                    }
                }
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(12)
                
                ForEach(campaigns) { campaign in
                    CampaignAnalyticsCard(campaign: campaign)
                }
            }
            .padding()
        }
    }
}

struct CampaignAnalyticsCard: View {
    let campaign: Campaign
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(campaign.title)
                .font(.headline)
                .foregroundColor(AppColors.textPrimary)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Engagement Rate")
                        .font(.caption2)
                        .foregroundColor(AppColors.textMuted)
                    Text("\(Int(campaign.progress * 100))%")
                        .font(.headline)
                        .foregroundColor(AppColors.primaryAccent)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text("ROI")
                        .font(.caption2)
                        .foregroundColor(AppColors.textMuted)
                    Text("Pending")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

struct BrandSettingsView: View {
    let profile: BrandProfile?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Brand Name")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    Text(profile?.brandName ?? "Brand")
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Website")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    Text(profile?.websiteUrl ?? "Not set")
                        .font(.body)
                        .foregroundColor(AppColors.textPrimary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(AppColors.cardBackground)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Industry")
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                    Text(profile?.industry ?? "Not set")
                        .font(.body)
                        .foregroundColor(AppColors.textPrimary)
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

struct CreateCampaignView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedPackage: CampaignPackage = .starterSpark
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: { dismiss() }) {
                        Text("Cancel")
                            .foregroundColor(AppColors.primaryAccent)
                    }
                    Spacer()
                    Text("Create Campaign")
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.textPrimary)
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundColor(AppColors.primaryAccent)
                }
                .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Select a Package")
                            .font(.headline)
                            .foregroundColor(AppColors.textPrimary)
                        
                        ForEach([CampaignPackage.starterSpark, .growthBoost, .viralWave, .launchStorm], id: \.name) { pkg in
                            PackageCard(
                                package: pkg,
                                isSelected: selectedPackage.name == pkg.name,
                                action: { selectedPackage = pkg }
                            )
                        }
                    }
                    .padding()
                }
                
                Button(action: { dismiss() }) {
                    HStack {
                        Text("Continue")
                        Spacer()
                        Text("$\(String(format: "%.2f", Double(selectedPackage.price) / 100.0))")
                            .fontWeight(.semibold)
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
}

#Preview {
    BrandDashboardView()
        .environmentObject(AppState())
}
