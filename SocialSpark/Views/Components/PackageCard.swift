import SwiftUI

struct PackageCard: View {
    let package: CampaignPackage
    let selected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(package.name)
                        .font(.headline)
                        .foregroundStyle(AppTheme.white)
                    Text(package.subtitle)
                        .font(.caption)
                        .foregroundStyle(AppTheme.mutedGray)
                }
                Spacer()
                Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(selected ? AppTheme.electricYellow : AppTheme.mutedGray)
            }
            Text("\(package.missionsIncluded) missions")
                .font(.subheadline)
                .foregroundStyle(AppTheme.sparkBlue)
            Text(String(format: "$%.2f", Double(package.priceCents) / 100))
                .font(.title3.weight(.semibold))
                .foregroundStyle(AppTheme.white)
        }
        .padding()
        .background(AppTheme.card)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(selected ? AppTheme.electricYellow : AppTheme.card, lineWidth: 1.5)
        )
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
