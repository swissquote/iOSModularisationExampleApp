import Foundation

/// Shared entity: created by AddEvent, listed by Details and shown by the app's EventDetails screen.
public struct Event: Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let date: Date

    public init(id: UUID = UUID(), title: String, subtitle: String, date: Date) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.date = date
    }
}
