import CommonDomain
import HomeFeatureDomain
import Observation

@Observable
public final class HomeViewModel {
    public private(set) var cities: [City] = []

    private let getCities: GetCitiesUseCase

    public init(getCities: GetCitiesUseCase) {
        self.getCities = getCities
    }

    @MainActor
    public func load() async {
        cities = (try? await getCities.execute()) ?? []
    }
}
