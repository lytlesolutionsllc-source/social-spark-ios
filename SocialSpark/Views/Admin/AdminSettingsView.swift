import SwiftUI

struct AdminSettingsView: View {
    @StateObject private var viewModel = AdminDashboardViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                SettingRow(title: "Daily mission limit", value: "\(viewModel.settings.missionDailyLimit)")
                SettingRow(title: "Auto-approve proofs", value: viewModel.settings.autoApproveProofs ? "On" : "Off")
                SettingRow(title: "Maintenance mode", value: viewModel.settings.maintenanceMode ? "On" : "Off")
                SettingRow(title: "Coin conversion", value: "100 coins = $1.00")
            }
            .padding()
        }
        .navigationTitle("Admin Settings")
        .navigationBarTitleDisplayMode(.inline)
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
