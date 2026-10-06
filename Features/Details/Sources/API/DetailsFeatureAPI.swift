import CommonDomain
import CommonNavigation
import UIKit

public protocol DetailsFeatureAPI {
    func detailsCoordinator(city: City, rootView: UINavigationController) -> AnyUnownedCoordinator
}
