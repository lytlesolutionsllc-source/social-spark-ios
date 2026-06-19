import SwiftUI

struct EarningsCard: View {
    let title: String
    let coins: Int
    let icon: String
    let color: Color
    
    var cashValue: String {
        String(format: "$%.2f", Double(coins) / 100.0)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(color)
                Text(title)
                    .font(.caption)
                    .foregroundColor(AppColors.textMuted)
            }
            
            HStack(alignment: .bottom, spacing: 4) {
                Text("\(coins)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(AppColors.textPrimary)
                Text("coins")
                    .font(.caption)
                    .foregroundColor(AppColors.textMuted)
            }
            
            Text(cashValue)
                .font(.caption)
                .foregroundColor(color)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

#Preview {
    VStack(spacing: 12) {
        EarningsCard(title: "Pending", coins: 450, icon: "hourglass.end", color: AppColors.primaryAccent)
        EarningsCard(title: "Approved", coins: 1250, icon: "checkmark.circle", color: AppColors.successColor)
        EarningsCard(title: "Paid", coins: 5000, icon: "banknote", color: AppColors.secondaryAccent)
    }
    .padding()
    .background(AppColors.primaryBackground)
}
