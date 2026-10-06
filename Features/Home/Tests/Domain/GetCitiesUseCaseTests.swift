import CommonDomain
import Foundation
import HomeFeatureDomain
import Testing

struct GetCitiesUseCaseTests {
    @Test func returnsRepositoryCities() async throws {
        let lugano = City(name: "Lugano", canton: "TI", imageURL: URL(string: "https://example.com/lugano.jpg")!)
        let useCase = GetCitiesUseCase(repository: StubCitiesRepository(cities: [lugano]))

        #expect(try await useCase.execute() == [lugano])
    }
}

private struct StubCitiesRepository: CitiesRepositoryProtocol {
    let cities: [City]

    func cities() async throws -> [City] {
        cities
    }
}
