import CommonDomain
import CommonModuleLoader
import CommonNavigation
import DetailsFeatureAPI
import HomeFeatureData
import HomeFeatureDomain
import SwiftUI
import UIKit

public final class HomeCoordinator: UnownedCoordinator<UINavigationController> {
    // Home only knows the Details API. The app registers its implementation.
    @YuhFeature private var detailsFeature: any DetailsFeatureAPI

    override public func start() {
        let viewModel = HomeViewModel(getCities: GetCitiesUseCase(repository: CitiesRepository()))
        rootView?.setViewControllers(
            [
                UIHostingController(
                    rootView: HomeView(navigationDelegate: self, viewModel: viewModel)
                )
            ],
            animated: false
        )
    }
}

extension HomeCoordinator: HomeNavigationDelegate {
    func home(didSelect city: City) {
        guard let rootView else {
            return
        }
        start(
            detailsFeature.detailsCoordinator(city: city, rootView: rootView)
        )
    }
}
