import Foundation

/// Shared entity: used by Home to list cities and by Details to show one.
public struct City: Identifiable, Hashable {
    public let id: UUID
    public let name: String
    public let canton: String
    public let imageURL: URL

    public init(id: UUID = UUID(), name: String, canton: String, imageURL: URL) {
        self.id = id
        self.name = name
        self.canton = canton
        self.imageURL = imageURL
    }
}
