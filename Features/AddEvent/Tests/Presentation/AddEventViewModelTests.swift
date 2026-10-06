import AddEventFeaturePresentation
import Testing

struct AddEventViewModelTests {
    @Test func cannotSaveWithoutTitle() {
        let viewModel = AddEventViewModel()

        #expect(!viewModel.canSave)
    }

    @Test func canSaveWithTitle() {
        let viewModel = AddEventViewModel()
        viewModel.title = "Summer Cinema"

        #expect(viewModel.canSave)
        #expect(viewModel.event?.title == "Summer Cinema")
    }
}
