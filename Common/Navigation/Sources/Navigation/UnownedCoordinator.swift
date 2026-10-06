open class UnownedCoordinator<RootView: AnyObject>: AnyUnownedCoordinator {
    public private(set) weak var rootView: RootView?

    public init(rootView: RootView) {
        self.rootView = rootView
    }
}
