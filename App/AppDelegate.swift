import AddEventFeature
import AddEventFeatureAPI
import AppFeatureAPI
import CommonModuleLoader
import DetailsFeature
import DetailsFeatureAPI
import HomeFeature
import HomeFeatureAPI
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        registerFeatureModules()
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    /// The app target is the only place that knows every implementation.
    private func registerFeatureModules() {
        CommonModuleLoader.shared.register(
            moduleAPI: (any HomeFeatureAPI).self,
            module: HomeFeatureModule()
        )
        CommonModuleLoader.shared.register(
            moduleAPI: (any DetailsFeatureAPI).self,
            module: DetailsFeatureModule()
        )
        CommonModuleLoader.shared.register(
            moduleAPI: (any AddEventFeatureAPI).self,
            module: AddEventFeatureModule()
        )

        // The monolith serves what is not modularised yet, like any other feature.
        CommonModuleLoader.shared.register(
            moduleAPI: (any AppEventDetailsFeatureAPI).self,
            module: self
        )
    }
}
