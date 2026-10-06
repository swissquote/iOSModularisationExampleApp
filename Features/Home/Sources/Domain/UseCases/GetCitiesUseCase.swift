import CommonDomain

public struct GetCitiesUseCase {
    private let repository: CitiesRepositoryProtocol

    public init(repository: CitiesRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() async throws -> [City] {
        try await repository.cities()
    }
}
