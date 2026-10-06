import AddEventFeatureAPI
import CommonDomain
import CommonNavigation
import SwiftUI
import UIKit

public final class AddEventCoordinator: UnownedCoordinator<UINavigationController> {
    private weak var navigationDelegate: AddEventCoordinatorNavigationDelegate?

    public init(
        rootView: UINavigationController,
        navigationDelegate: AddEventCoordinatorNavigationDelegate
    ) {
        self.navigationDelegate = navigationDelegate
        super.init(rootView: rootView)
    }

    override public func start() {
        rootView?.setViewControllers(
            [UIHostingController(rootView: AddEventView(navigationDelegate: self))],
            animated: false
        )
    }
}

extension AddEventCoordinator: AddEventNavigationDelegate {
    func addEvent(didSave event: Event) {
        navigationDelegate?.addEventCoordinator(didSave: event, coordinator: self)
    }

    func addEventDidCancel() {
        navigationDelegate?.addEventCoordinator(didPressCancel: self)
    }
}
