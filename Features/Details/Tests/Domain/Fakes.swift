import CommonDomain
import DetailsFeatureDomain
import Foundation

final class FakeEventsRepository: EventsRepositoryProtocol {
    private(set) var events: [Event]

    init(events: [Event] = []) {
        self.events = events
    }

    func events(for city: City) async throws -> [Event] {
        events
    }

    func add(_ event: Event, to city: City) async {
        events.append(event)
    }
}

extension City {
    static let zurich = City(name: "Zurich", canton: "ZH", imageURL: URL(string: "https://example.com/zurich.jpg")!)
}
