import AddEventFeatureDomain
import CommonDomain
import Foundation
import Observation

@Observable
public final class AddEventViewModel {
    public var title = ""
    public var subtitle = ""
    public var date = Date()

    private let validateEvent: ValidateEventUseCase

    public init(validateEvent: ValidateEventUseCase = ValidateEventUseCase()) {
        self.validateEvent = validateEvent
    }

    public var event: Event? {
        validateEvent.execute(title: title, subtitle: subtitle, date: date)
    }

    public var canSave: Bool {
        event != nil
    }
}
