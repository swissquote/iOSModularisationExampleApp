public struct EventResponse: Decodable, Equatable {
    public let title: String
    public let subtitle: String
    /// ISO 8601 date, e.g. "2026-07-04".
    public let date: String

    public init(title: String, subtitle: String, date: String) {
        self.title = title
        self.subtitle = subtitle
        self.date = date
    }
}
