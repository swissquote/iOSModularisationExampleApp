import CommonDomain
import DetailsFeatureDomain
import Foundation
import Testing

struct GetEventsUseCaseTests {
    @Test func sortsEventsByDate() async throws {
        let later = Event(title: "Later", subtitle: "", date: Date(timeIntervalSince1970: 2_000))
        let sooner = Event(title: "Sooner", subtitle: "", date: Date(timeIntervalSince1970: 1_000))
        let useCase = GetEventsUseCase(repository: FakeEventsRepository(events: [later, sooner]))

        let events = try await useCase.execute(city: .zurich)

        #expect(events.map(\.title) == ["Sooner", "Later"])
    }
}
