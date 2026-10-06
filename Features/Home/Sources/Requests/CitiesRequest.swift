public protocol CitiesRequesting {
    func fetchCities() async throws -> [CityResponse]
}

/// Fake API call returning a fixed list of Swiss cities.
public struct FakeCitiesRequest: CitiesRequesting {
    public init() {}

    public func fetchCities() async throws -> [CityResponse] {
        [
            CityResponse(name: "Geneva", canton: "GE", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Geneve_2005_001_Ork.ch.jpg/1280px-Geneve_2005_001_Ork.ch.jpg"),
            CityResponse(name: "Lausanne", canton: "VD", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Lausanne_-_panoramio_%281%29.jpg/1280px-Lausanne_-_panoramio_%281%29.jpg"),
            CityResponse(name: "Zurich", canton: "ZH", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Altstadt_Z%C3%BCrich_2015.jpg/1280px-Altstadt_Z%C3%BCrich_2015.jpg"),
            CityResponse(name: "Bern", canton: "BE", imageURL: "https://upload.wikimedia.org/wikipedia/commons/4/45/Bundeshaus_Bern_2009%2C_Flooffy.jpg"),
            CityResponse(name: "Basel", canton: "BS", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Basel_-_M%C3%BCnsterpfalz1.jpg/1280px-Basel_-_M%C3%BCnsterpfalz1.jpg"),
            CityResponse(name: "Lucerne", canton: "LU", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/2009_08_24_06262_Lucerne.jpg/1280px-2009_08_24_06262_Lucerne.jpg"),
            CityResponse(name: "St. Gallen", canton: "SG", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/St.Gallen_vonDreiweieren_09.jpg/1280px-St.Gallen_vonDreiweieren_09.jpg"),
            CityResponse(name: "Lugano", canton: "TI", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Lago_di_Lugano_at_Sunset_%28cropped_2%29.jpg/1280px-Lago_di_Lugano_at_Sunset_%28cropped_2%29.jpg")
        ]
    }
}
