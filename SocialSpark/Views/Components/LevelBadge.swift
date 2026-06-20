import SwiftUI

struct LevelBadge: View {
    let level: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "star.fill")
            Text(level)
                .font(.caption.weight(.semibold))
        }
        .foregroundStyle(AppTheme.deepNavy)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(AppTheme.electricYellow)
        .clipShape(Capsule())
    }
}
