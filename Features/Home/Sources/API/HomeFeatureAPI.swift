import CommonNavigation
import UIKit

public protocol HomeFeatureAPI {
    func homeCoordinator(rootView: UINavigationController) -> AnyUnownedCoordinator
}
