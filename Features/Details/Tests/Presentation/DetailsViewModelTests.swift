import CommonDomain
import DetailsFeatureDomain
import DetailsFeaturePresentation
import Foundation
import Testing

@MainActor
struct DetailsViewModelTests {
    private let city = City(name: "Basel", canton: "BS", imageURL: URL(string: "https://example.com/basel.jpg")!)

    @Test func addingAnEventReloadsTheList() async {
        let repository = InMemoryEventsRepository()
        let viewModel = DetailsViewModel(
            city: city,
            getEvents: GetEventsUseCase(repository: repository),
            addEvent: AddEventUseCase(repository: repository)
        )

        await viewModel.add(Event(title: "Art Basel", subtitle: "", date: .now))

        #expect(viewModel.events.map(\.title) == ["Art Basel"])
    }
}

private final class InMemoryEventsRepository: EventsRepositoryProtocol {
    private var events: [Event] = []

    func events(for city: City) async throws -> [Event] {
        events
    }

    func add(_ event: Event, to city: City) async {
        events.append(event)
    }
}
