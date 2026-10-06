import CommonDomain

public protocol CitiesRepositoryProtocol {
    func cities() async throws -> [City]
}
