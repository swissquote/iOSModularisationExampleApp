import CommonDomain
import DetailsFeatureData
import DetailsFeatureRequests
import Foundation
import Testing

struct EventsRepositoryTests {
    private let city = City(name: "Bern", canton: "BE", imageURL: URL(string: "https://example.com/bern.jpg")!)

    @Test func addedEventIsReturnedWithFetchedOnes() async throws {
        let repository = EventsRepository(request: StubEventsRequest())
        let event = Event(title: "New", subtitle: "", date: .now)

        await repository.add(event, to: city)
        let events = try await repository.events(for: city)

        #expect(events.map(\.title) == ["Fetched", "New"])
    }
}

private struct StubEventsRequest: EventsRequesting {
    func fetchEvents(cityName: String) async throws -> [EventResponse] {
        [EventResponse(title: "Fetched", subtitle: "", date: "2026-07-04")]
    }
}
