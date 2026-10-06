import CommonDomain

public struct AddEventUseCase {
    private let repository: EventsRepositoryProtocol

    public init(repository: EventsRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(event: Event, city: City) async {
        await repository.add(event, to: city)
    }
}
