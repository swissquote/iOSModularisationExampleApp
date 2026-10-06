import CommonDomain
import Foundation

public struct ValidateEventUseCase {
    public init() {}

    /// Returns an event when the input is valid, `nil` otherwise.
    public func execute(title: String, subtitle: String, date: Date) -> Event? {
        let title = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !title.isEmpty else {
            return nil
        }

        return Event(
            title: title,
            subtitle: subtitle.trimmingCharacters(in: .whitespacesAndNewlines),
            date: date
        )
    }
}
