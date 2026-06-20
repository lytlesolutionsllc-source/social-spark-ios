import SwiftUI

struct SparkButton: View {
    let title: String
    var icon: String?
    var style: Style = .primary
    var action: () -> Void

    enum Style {
        case primary
        case secondary
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon {
                    Image(systemName: icon)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .foregroundStyle(style == .primary ? AppTheme.deepNavy : AppTheme.white)
            .background(style == .primary ? AppTheme.electricYellow : AppTheme.card)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(AppTheme.sparkBlue.opacity(style == .secondary ? 0.45 : 0), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
