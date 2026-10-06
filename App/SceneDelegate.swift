import CommonModuleLoader
import HomeFeatureAPI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    @YuhFeature private var homeFeature: any HomeFeatureAPI

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        window = UIWindow(windowScene: windowScene)

        let homeNavigationController = UINavigationController()
        homeFeature.homeCoordinator(rootView: homeNavigationController).start()

        window?.rootViewController = homeNavigationController
        window?.makeKeyAndVisible()
    }
}
