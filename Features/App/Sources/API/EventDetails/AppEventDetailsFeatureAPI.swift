import CommonDomain
import UIKit

/// Served by the app target: EventDetails is not modularised yet.
/// Once it moves into its own module, this protocol becomes `EventDetailsFeatureAPI`
/// and the features using it only change the protocol name.
public protocol AppEventDetailsFeatureAPI {
    func eventDetailsViewController(event: Event) -> UIViewController
}
