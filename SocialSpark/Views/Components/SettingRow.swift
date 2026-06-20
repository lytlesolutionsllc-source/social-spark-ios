import SwiftUI

struct SettingRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(AppTheme.white)
            Spacer()
            Text(value)
                .foregroundStyle(AppTheme.mutedGray)
        }
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
