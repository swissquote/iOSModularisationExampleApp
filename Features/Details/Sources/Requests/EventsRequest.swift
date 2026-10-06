public protocol EventsRequesting {
    func fetchEvents(cityName: String) async throws -> [EventResponse]
}

/// Fake API call returning the same seed events for every city.
public struct FakeEventsRequest: EventsRequesting {
    public init() {}

    public func fetchEvents(cityName: String) async throws -> [EventResponse] {
        [
            EventResponse(title: "Jazz Festival", subtitle: "Open-air concerts at the lakeside", date: "2026-07-04"),
            EventResponse(title: "Food & Wine Market", subtitle: "Local producers and regional specialties", date: "2026-07-18"),
            EventResponse(title: "Summer Cinema", subtitle: "Outdoor screenings under the stars", date: "2026-08-01"),
            EventResponse(title: "Mountain Trail Run", subtitle: "10 km and 21 km courses", date: "2026-08-22"),
            EventResponse(title: "Autumn Craft Fair", subtitle: "Handmade goods from local artisans", date: "2026-09-12")
        ]
    }
}
