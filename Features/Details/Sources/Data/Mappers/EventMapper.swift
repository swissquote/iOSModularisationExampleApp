import CommonDomain
import DetailsFeatureRequests
import Foundation

public enum EventMapper {
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    /// Maps a response into an entity. Returns `nil` when the date is invalid.
    public static func map(_ response: EventResponse) -> Event? {
        guard let date = formatter.date(from: response.date) else {
            return nil
        }
        return Event(title: response.title, subtitle: response.subtitle, date: date)
    }
}
