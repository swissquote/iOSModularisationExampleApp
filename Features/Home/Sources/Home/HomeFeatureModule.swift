import CommonNavigation
import HomeFeatureAPI
import HomeFeaturePresentation
import UIKit

/// The hidden implementation of HomeFeatureAPI, registered by the app at launch.
public struct HomeFeatureModule: HomeFeatureAPI {
    public init() {}

    public func homeCoordinator(rootView: UINavigationController) -> AnyUnownedCoordinator {
        HomeCoordinator(rootView: rootView)
    }
}
