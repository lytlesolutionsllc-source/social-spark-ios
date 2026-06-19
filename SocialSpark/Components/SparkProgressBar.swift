import SwiftUI

struct SparkProgressBar: View {
    let progress: Double
    let height: CGFloat = 6
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(AppColors.cardBackground)
                
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [AppColors.primaryAccent, AppColors.secondaryAccent]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * progress)
            }
        }
        .frame(height: height)
    }
}

#Preview {
    VStack(spacing: 12) {
        SparkProgressBar(progress: 0.3)
        SparkProgressBar(progress: 0.6)
        SparkProgressBar(progress: 1.0)
    }
    .padding()
    .background(AppColors.primaryBackground)
}
