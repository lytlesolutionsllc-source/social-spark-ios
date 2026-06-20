import SwiftUI

struct AccountTypePickerView: View {
    @EnvironmentObject private var appState: AppStateViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Choose your account type")
                .font(.title2.bold())
                .foregroundStyle(AppTheme.white)

            ForEach(AppUser.AccountType.allCases, id: \.self) { type in
                SparkButton(title: type.rawValue, icon: "person.fill") {
                    appState.chooseAccountType(type)
                }
            }

            Spacer()

            SparkButton(title: "Back", style: .secondary) {
                appState.reset()
            }
        }
        .padding()
        .background(AppTheme.deepNavy.ignoresSafeArea())
    }
}
