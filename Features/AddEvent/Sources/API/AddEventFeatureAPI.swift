import CommonNavigation
import UIKit

public protocol AddEventFeatureAPI {
    func addEventCoordinator(
        rootView: UINavigationController,
        navigationDelegate: AddEventCoordinatorNavigationDelegate
    ) -> AnyUnownedCoordinator
}
