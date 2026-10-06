import OSLog

/// Resolves the registered implementation of a feature API each time it is accessed.
///
///     @YuhFeature private var detailsFeature: any DetailsFeatureAPI
@propertyWrapper public struct YuhFeature<T> {
    public var wrappedValue: T {
        get {
            CommonModuleLoader.shared.module(for: T.self)
        }
        set {
            Logger.moduleLoader.fault("⛔️ Updating feature module \(T.self) is unsupported.")
        }
    }

    public init() {
        // Empty initializer
    }
}
