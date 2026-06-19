import Foundation

struct MissionAction: Identifiable, Codable {
    let id: String
    let type: ActionType
    let coinReward: Int
    let requiresProof: Bool
    var completed: Bool = false
    let description: String
    let icon: String
    
    enum ActionType: String, Codable {
        case watchReel = "Watch Reel"
        case likeOrSave = "Like or Save"
        case thoughtfulComment = "Thoughtful Comment"
        case storyShare = "Story Share"
        case profileClick = "Profile Click"
        case linkClick = "Link Click"
        case quizCompletion = "Quiz Completion"
        case appDownload = "App Download"
        case tagFriend = "Tag Friend"
    }
}
