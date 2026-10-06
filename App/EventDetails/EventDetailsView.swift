import CommonDomain
import SwiftUI

/// Legacy screen: still part of the app target ("the monolith").
/// Details reaches it through AppEventDetailsFeatureAPI.
struct EventDetailsView: View {
    let event: Event

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text(event.title)
                        .font(.largeTitle.bold())
                    Text(event.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 8)
            }

            Section("Date") {
                Label(event.date.formatted(date: .long, time: .omitted), systemImage: "calendar")
            }
        }
        .navigationTitle(event.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
