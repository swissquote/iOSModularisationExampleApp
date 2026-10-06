import CommonDomain
import DetailsFeatureDomain
import Observation

@Observable
public final class DetailsViewModel {
    public let city: City
    public private(set) var events: [Event] = []

    private let getEvents: GetEventsUseCase
    private let addEvent: AddEventUseCase

    public init(city: City, getEvents: GetEventsUseCase, addEvent: AddEventUseCase) {
        self.city = city
        self.getEvents = getEvents
        self.addEvent = addEvent
    }

    @MainActor
    public func load() async {
        events = (try? await getEvents.execute(city: city)) ?? []
    }

    @MainActor
    public func add(_ event: Event) async {
        await addEvent.execute(event: event, city: city)
        await load()
    }
}
