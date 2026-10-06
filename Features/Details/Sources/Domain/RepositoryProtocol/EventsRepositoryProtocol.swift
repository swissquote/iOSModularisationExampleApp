import CommonDomain

public protocol EventsRepositoryProtocol {
    func events(for city: City) async throws -> [Event]
    func add(_ event: Event, to city: City) async
}
