import CommonDomain
import Foundation
import HomeFeatureRequests

public enum CityMapper {
    /// Maps a response into an entity. Returns `nil` when the image URL is invalid.
    public static func map(_ response: CityResponse) -> City? {
        guard let imageURL = URL(string: response.imageURL) else {
            return nil
        }
        return City(name: response.name, canton: response.canton, imageURL: imageURL)
    }
}
