public struct CityResponse: Decodable, Equatable {
    public let name: String
    public let canton: String
    public let imageURL: String

    public init(name: String, canton: String, imageURL: String) {
        self.name = name
        self.canton = canton
        self.imageURL = imageURL
    }
}
