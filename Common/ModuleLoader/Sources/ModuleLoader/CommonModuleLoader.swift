import OSLog

/// Module loader responsible for registering and serving feature modules.
public class CommonModuleLoader {
    public static let shared = CommonModuleLoader()

    private var modules: [String: Any] = [:]

    public init() {
        Logger.moduleLoader.info("🚀 Created new CommonModuleLoader")
    }

    public func register<ModuleAPI>(
        moduleAPI: ModuleAPI.Type,
        module: ModuleAPI
    ) {
        let identifier = moduleIdentifier(for: moduleAPI)
        modules[identifier] = module
        Logger.moduleLoader.info("📦 Registered module for identifier: \(identifier)")
    }

    public func module<ModuleAPI>(for moduleAPI: ModuleAPI.Type) -> ModuleAPI {
        let identifier = moduleIdentifier(for: moduleAPI)

        guard let module = modules[identifier] else {
            fatalError("Unable to find module for identifier: \(identifier)")
        }

        guard let typedModule = module as? ModuleAPI else {
            fatalError("Found \(module) for identifier: \(identifier), but its type doesn't match \(moduleAPI)")
        }

        return typedModule
    }

    private func moduleIdentifier<ModuleAPI>(for moduleAPI: ModuleAPI.Type) -> String {
        String(describing: moduleAPI)
    }
}
