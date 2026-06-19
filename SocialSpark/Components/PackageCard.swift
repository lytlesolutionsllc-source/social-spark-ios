import SwiftUI

struct PackageCard: View {
    let package: CampaignPackage
    var isSelected: Bool = false
    var onSelect: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(package.name)
                        .font(.headline)
                        .foregroundColor(AppColors.textPrimary)
                    Text(package.description)
                        .font(.caption)
                        .foregroundColor(AppColors.textMuted)
                }
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? AppColors.primaryAccent : Color.gray.opacity(0.5))
            }
            
            Divider()
                .background(AppColors.cardBackground)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(package.missions) missions")
                        .font(.headline)
                        .foregroundColor(AppColors.primaryAccent)
                    Text("Creator payouts included")
                        .font(.caption2)
                        .foregroundColor(AppColors.textMuted)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text("$\(String(format: "%.2f", Double(package.price) / 100.0))")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.textPrimary)
                    Text("per mission: $\(String(format: "%.2f", Double(package.price) / Double(package.missions) / 100.0))")
                        .font(.caption2)
                        .foregroundColor(AppColors.textMuted)
                }
            }
        }
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? AppColors.primaryAccent : Color.clear, lineWidth: 2)
        )
        .onTapGesture(perform: onSelect)
    }
}

#Preview {
    VStack(spacing: 12) {
        PackageCard(package: .starterSpark, isSelected: false)
        PackageCard(package: .growthBoost, isSelected: true)
    }
    .padding()
    .background(AppColors.primaryBackground)
}
