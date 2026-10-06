import CommonDomain
import CommonNavigation

/// Events sent by the AddEvent flow to the feature that presented it.
public protocol AddEventCoordinatorNavigationDelegate: AnyObject {
    func addEventCoordinator(didSave event: Event, coordinator: AnyUnownedCoordinator)
    func addEventCoordinator(didPressCancel coordinator: AnyUnownedCoordinator)
}
