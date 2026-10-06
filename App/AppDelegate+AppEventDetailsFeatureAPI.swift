import AppFeatureAPI
import CommonDomain
import SwiftUI
import UIKit

extension AppDelegate: AppEventDetailsFeatureAPI {
    func eventDetailsViewController(event: Event) -> UIViewController {
        UIHostingController(rootView: EventDetailsView(event: event))
    }
}
