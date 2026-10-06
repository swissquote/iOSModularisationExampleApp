import CommonDomain
import DetailsFeatureDomain
import DetailsFeatureRequests

/// Fetches events once per city, then keeps them in memory.
public final class EventsRepository: EventsRepositoryProtocol {
    private let request: EventsRequesting
    private var cache: [City.ID: [Event]] = [:]

    public init(request: EventsRequesting) {
        self.request = request
    }

    public convenience init() {
        self.init(request: FakeEventsRequest())
    }

    public func events(for city: City) async throws -> [Event] {
        if let events = cache[city.id] {
            return events
        }
        let events = try await request.fetchEvents(cityName: city.name).compactMap(EventMapper.map)
        cache[city.id] = events
        return events
    }

    public func add(_ event: Event, to city: City) async {
        let events = (try? await events(for: city)) ?? []
        cache[city.id] = events + [event]
    }
}
