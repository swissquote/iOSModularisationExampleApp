import AddEventFeatureAPI
import AddEventFeaturePresentation
import CommonNavigation
import UIKit

/// The hidden implementation of AddEventFeatureAPI, registered by the app at launch.
public struct AddEventFeatureModule: AddEventFeatureAPI {
    public init() {}

    public func addEventCoordinator(
        rootView: UINavigationController,
        navigationDelegate: AddEventCoordinatorNavigationDelegate
    ) -> AnyUnownedCoordinator {
        AddEventCoordinator(rootView: rootView, navigationDelegate: navigationDelegate)
    }
}
