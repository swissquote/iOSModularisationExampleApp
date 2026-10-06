import CommonDomain
import SwiftUI

protocol AddEventNavigationDelegate: AnyObject {
    func addEvent(didSave event: Event)
    func addEventDidCancel()
}

struct AddEventView: View {
    // Strong reference: the view keeps its coordinator alive.
    let navigationDelegate: AddEventNavigationDelegate

    @State private var viewModel = AddEventViewModel()

    var body: some View {
        Form {
            Section("Details") {
                TextField("Title", text: $viewModel.title)
                TextField("Description", text: $viewModel.subtitle)
            }
            Section("Date") {
                DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
        }
        .navigationTitle("New Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { navigationDelegate.addEventDidCancel() }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    guard let event = viewModel.event else {
                        return
                    }
                    navigationDelegate.addEvent(didSave: event)
                }
                .disabled(!viewModel.canSave)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddEventView(navigationDelegate: PreviewAddEventNavigationDelegate())
    }
}

private final class PreviewAddEventNavigationDelegate: AddEventNavigationDelegate {
    func addEvent(didSave event: Event) {}
    func addEventDidCancel() {}
}
