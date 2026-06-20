import SwiftUI

struct SparkProgressBar: View {
    let progress: Double

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(AppTheme.card)
                RoundedRectangle(cornerRadius: 6)
                    .fill(LinearGradient(colors: [AppTheme.sparkBlue, AppTheme.electricYellow], startPoint: .leading, endPoint: .trailing))
                    .frame(width: proxy.size.width * max(0, min(1, progress)))
            }
        }
        .frame(height: 10)
    }
}
