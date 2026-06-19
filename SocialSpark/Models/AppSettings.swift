import Foundation

struct AppSettings: Codable {
    var standardSparkRunCoins: Int = 60
    var coinsPerDollar: Int = 100
    var minimumCashoutCoins: Int = 1000
    var payoutDelayDays: Int = 7
    var maxMissionsPerCreatorPerDay: Int = 5
    var maxSameBrandMissionsPerCreatorPerDay: Int = 1
    var maxSameBrandMissionsPerCreatorPerMonth: Int = 3
    var maxCommentsPerCreatorPerDay: Int = 10
    var maxStorySharesPerCreatorPerDay: Int = 3
    var minimumCommentWordCount: Int = 8
    var requireManualProofReview: Bool = true
    var requireDisclosure: Bool = true
    var autoApproveCreators: Bool = false
    var autoApproveCampaigns: Bool = false
}
