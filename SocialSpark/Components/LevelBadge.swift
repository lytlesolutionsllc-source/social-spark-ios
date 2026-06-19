import SwiftUI

struct LevelBadge: View {
    let level: CreatorProfile.CreatorLevel
    
    var badgeColor: Color {
        switch level {
        case .newSpark: return Color.gray
        case .trustedSpark: return AppColors.successColor
        case .powerSpark: return AppColors.primaryAccent
        case .brandFavorite: return AppColors.secondaryAccent
        case .sparkElite: return Color.red
        }
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "star.fill")
                .font(.system(size: 16))
            Text(level.rawValue)
                .font(.caption2)
                .fontWeight(.semibold)
        }
        .foregroundColor(AppColors.textPrimary)
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(badgeColor.opacity(0.2))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(badgeColor, lineWidth: 1)
        )
    }
}

#Preview {
    VStack(spacing: 12) {
        LevelBadge(level: .newSpark)
        LevelBadge(level: .trustedSpark)
        LevelBadge(level: .powerSpark)
        LevelBadge(level: .brandFavorite)
        LevelBadge(level: .sparkElite)
    }
    .padding()
    .background(AppColors.primaryBackground)
}
