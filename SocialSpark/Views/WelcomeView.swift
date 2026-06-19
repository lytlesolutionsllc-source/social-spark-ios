import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedAccountType: AppUser.AccountType? = nil
    
    var body: some View {
        ZStack {
            AppColors.primaryBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 32) {
                        VStack(spacing: 16) {
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 60))
                                .foregroundColor(AppColors.primaryAccent)
                            
                            Text("Social Spark")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(AppColors.textPrimary)
                            
                            Text("Creator-powered missions for brands that want real social momentum.")
                                .font(.body)
                                .foregroundColor(AppColors.textMuted)
                                .multilineTextAlignment(.center)
                        }
                        
                        VStack(spacing: 12) {
                            AccountTypeButton(
                                title: "Creator",
                                description: "Earn coins by completing brand missions",
                                icon: "person.crop.circle.fill",
                                isSelected: selectedAccountType == .creator,
                                action: { selectedAccountType = .creator }
                            )
                            
                            AccountTypeButton(
                                title: "Brand",
                                description: "Launch campaigns with creator reach",
                                icon: "building.2.fill",
                                isSelected: selectedAccountType == .brand,
                                action: { selectedAccountType = .brand }
                            )
                            
                            AccountTypeButton(
                                title: "Admin",
                                description: "Manage platform & approvals",
                                icon: "gearshape.fill",
                                isSelected: selectedAccountType == .admin,
                                action: { selectedAccountType = .admin }
                            )
                        }
                        .padding(.vertical, 20)
                    }
                    .padding()
                }
                
                Button(action: handleLogin) {
                    HStack {
                        Text("Continue")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColors.primaryAccent)
                    .foregroundColor(AppColors.primaryBackground)
                    .cornerRadius(12)
                }
                .disabled(selectedAccountType == nil)
                .opacity(selectedAccountType == nil ? 0.5 : 1.0)
                .padding()
            }
        }
    }
    
    private func handleLogin() {
        switch selectedAccountType {
        case .creator:
            appState.loginAsCreator()
        case .brand:
            appState.loginAsBrand()
        case .admin:
            appState.loginAsAdmin()
        case .none:
            break
        }
    }
}

struct AccountTypeButton: View {
    let title: String
    let description: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.primaryAccent)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
                
                Spacer()
                
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? AppColors.primaryAccent : AppColors.textMuted)
            }
            .padding()
            .background(AppColors.cardBackground)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? AppColors.primaryAccent : Color.clear, lineWidth: 2)
            )
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(AppState())
}
