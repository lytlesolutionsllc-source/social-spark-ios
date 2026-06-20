import SwiftUI

enum AppTheme {
    static let deepNavy = Color(hex: 0x090D1A)
    static let card = Color(hex: 0x141A2A)
    static let electricYellow = Color(hex: 0xFFD400)
    static let sparkBlue = Color(hex: 0x00B8FF)
    static let white = Color(hex: 0xFFFFFF)
    static let mutedGray = Color(hex: 0xB8C0CC)
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
