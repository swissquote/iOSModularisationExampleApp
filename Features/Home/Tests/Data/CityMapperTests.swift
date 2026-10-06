import HomeFeatureData
import HomeFeatureRequests
import Testing

struct CityMapperTests {
    @Test func mapsValidResponse() throws {
        let city = try #require(CityMapper.map(CityResponse(name: "Geneva", canton: "GE", imageURL: "https://example.com/geneva.jpg")))

        #expect(city.name == "Geneva")
        #expect(city.canton == "GE")
    }

    @Test func dropsInvalidURL() {
        #expect(CityMapper.map(CityResponse(name: "Nowhere", canton: "", imageURL: "")) == nil)
    }

    @Test func fakeRequestReturnsEightCities() async throws {
        #expect(try await CitiesRepository().cities().count == 8)
    }
}
