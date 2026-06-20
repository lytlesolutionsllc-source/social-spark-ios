import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var appState: AppStateViewModel

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: "bolt.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(AppTheme.electricYellow)
            Text("Social Spark")
                .font(.largeTitle.bold())
                .foregroundStyle(AppTheme.white)
            Text("A gamified creator mission marketplace.")
                .foregroundStyle(AppTheme.mutedGray)

            SparkButton(title: "Get Started", icon: "arrow.right") {
                appState.goToAccountTypePicker()
            }
            Spacer()
        }
        .padding()
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
