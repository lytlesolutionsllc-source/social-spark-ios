import Foundation

struct ProofSubmission: Identifiable, Codable {
    let id: String
    let missionId: String
    let creatorId: String
    let commentText: String?
    let storyScreenshotUrl: String?
    let repostScreenshotUrl: String?
    let profileClickScreenshotUrl: String?
    let linkClickProofUrl: String?
    let notes: String?
    let submittedAt: Date
    let reviewStatus: ReviewStatus
    let rejectionReason: String?
    
    enum ReviewStatus: String, Codable {
        case pending
        case approved
        case rejected
    }
}
