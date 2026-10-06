import CommonDomain
import Foundation
import HomeFeatureDomain
import HomeFeaturePresentation
import Testing

@MainActor
struct HomeViewModelTests {
    @Test func loadsCities() async {
        let bern = City(name: "Bern", canton: "BE", imageURL: URL(string: "https://example.com/bern.jpg")!)
        let viewModel = HomeViewModel(getCities: GetCitiesUseCase(repository: StubCitiesRepository(cities: [bern])))

        await viewModel.load()

        #expect(viewModel.cities == [bern])
    }
}

private struct StubCitiesRepository: CitiesRepositoryProtocol {
    let cities: [City]

    func cities() async throws -> [City] {
        cities
    }
}
