import Foundation

/// Base coordinator from the UnownedCoordinator pattern: views own their coordinator,
/// so a coordinator is released as soon as its last view leaves the screen.
open class AnyUnownedCoordinator: NSObject, AnyCoordinator {
    private var childCoordinators = NSHashTable<AnyUnownedCoordinator>.weakObjects()

    override public init() {
        super.init()
    }

    open func start() {
        assertionFailure("AnyUnownedCoordinator.start() must be overridden")
    }

    deinit {
        print("\(String(describing: self)) deleted")
    }
}

public extension AnyUnownedCoordinator {
    func addChild(_ child: AnyUnownedCoordinator) {
        childCoordinators.add(child)
    }

    func removeChild(_ child: AnyUnownedCoordinator) {
        childCoordinators.remove(child)
    }

    func start(_ child: AnyUnownedCoordinator) {
        addChild(child)

        child.start()
    }
}
