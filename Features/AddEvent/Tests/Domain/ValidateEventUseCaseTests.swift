import AddEventFeatureDomain
import Foundation
import Testing

struct ValidateEventUseCaseTests {
    private let useCase = ValidateEventUseCase()

    @Test func rejectsEmptyTitle() {
        #expect(useCase.execute(title: "   ", subtitle: "", date: .now) == nil)
    }

    @Test func trimsTitleAndSubtitle() throws {
        let event = try #require(useCase.execute(title: "  Jazz  ", subtitle: " Lakeside ", date: .now))

        #expect(event.title == "Jazz")
        #expect(event.subtitle == "Lakeside")
    }
}
