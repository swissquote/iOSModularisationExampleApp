import AddEventFeatureAPI
import AppFeatureAPI
import CommonDomain
import CommonModuleLoader
import CommonNavigation
import DetailsFeatureData
import DetailsFeatureDomain
import SwiftUI
import UIKit

public final class DetailsCoordinator: UnownedCoordinator<UINavigationController> {
    // Other features are only known through their APIs, resolved at runtime.
    @YuhFeature private var addEventFeature: any AddEventFeatureAPI
    @YuhFeature private var eventDetailsFeature: any AppEventDetailsFeatureAPI

    private let viewModel: DetailsViewModel

    public init(city: City, rootView: UINavigationController) {
        let repository = EventsRepository()
        viewModel = DetailsViewModel(
            city: city,
            getEvents: GetEventsUseCase(repository: repository),
            addEvent: AddEventUseCase(repository: repository)
        )
        super.init(rootView: rootView)
    }

    override public func start() {
        rootView?.pushViewController(
            UIHostingController(
                rootView: DetailsView(navigationDelegate: self, viewModel: viewModel)
            ),
            animated: true
        )
    }
}

extension DetailsCoordinator: DetailsNavigationDelegate {
    func details(didSelect event: Event) {
        // EventDetails still lives in the app target, served through an App API.
        rootView?.pushViewController(
            eventDetailsFeature.eventDetailsViewController(event: event),
            animated: true
        )
    }

    func detailsDidTapAddEvent() {
        let addEventNavigationController = UINavigationController()
        start(
            addEventFeature.addEventCoordinator(
                rootView: addEventNavigationController,
                navigationDelegate: self
            )
        )
        rootView?.present(addEventNavigationController, animated: true)
    }
}

extension DetailsCoordinator: AddEventCoordinatorNavigationDelegate {
    public func addEventCoordinator(didSave event: Event, coordinator: AnyUnownedCoordinator) {
        Task { @MainActor in
            await viewModel.add(event)
        }
        rootView?.dismiss(animated: true)
    }

    public func addEventCoordinator(didPressCancel coordinator: AnyUnownedCoordinator) {
        rootView?.dismiss(animated: true)
    }
}
