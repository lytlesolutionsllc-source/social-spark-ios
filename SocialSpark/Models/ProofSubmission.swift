import Foundation

struct ProofSubmission: Identifiable, Hashable {
    let id: UUID
    let missionID: UUID
    let notes: String
    let status: ReviewStatus

    enum ReviewStatus: String, Hashable {
        case pending = "Pending Review"
        case approved = "Approved"
        case rejected = "Rejected"
    }
}
