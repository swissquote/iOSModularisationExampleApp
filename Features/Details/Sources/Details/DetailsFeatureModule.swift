import CommonDomain
import CommonNavigation
import DetailsFeatureAPI
import DetailsFeaturePresentation
import UIKit

/// The hidden implementation of DetailsFeatureAPI, registered by the app at launch.
public struct DetailsFeatureModule: DetailsFeatureAPI {
    public init() {}

    public func detailsCoordinator(city: City, rootView: UINavigationController) -> AnyUnownedCoordinator {
        DetailsCoordinator(city: city, rootView: rootView)
    }
}
