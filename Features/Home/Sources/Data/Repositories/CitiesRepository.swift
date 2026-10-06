import CommonDomain
import HomeFeatureDomain
import HomeFeatureRequests

public final class CitiesRepository: CitiesRepositoryProtocol {
    private let request: CitiesRequesting

    public init(request: CitiesRequesting) {
        self.request = request
    }

    public convenience init() {
        self.init(request: FakeCitiesRequest())
    }

    public func cities() async throws -> [City] {
        try await request.fetchCities().compactMap(CityMapper.map)
    }
}
