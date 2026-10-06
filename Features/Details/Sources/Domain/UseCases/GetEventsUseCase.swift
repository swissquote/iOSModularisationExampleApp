import CommonDomain

public struct GetEventsUseCase {
    private let repository: EventsRepositoryProtocol

    public init(repository: EventsRepositoryProtocol) {
        self.repository = repository
    }

    /// Returns the city's events, sorted by date.
    public func execute(city: City) async throws -> [Event] {
        try await repository.events(for: city).sorted { $0.date < $1.date }
    }
}
