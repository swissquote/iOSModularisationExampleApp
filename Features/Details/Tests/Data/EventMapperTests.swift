import DetailsFeatureData
import DetailsFeatureRequests
import Foundation
import Testing

struct EventMapperTests {
    @Test func mapsValidResponse() throws {
        let event = try #require(EventMapper.map(EventResponse(title: "Jazz", subtitle: "Lakeside", date: "2026-07-04")))

        let components = Calendar.current.dateComponents([.year, .month, .day], from: event.date)
        #expect(event.title == "Jazz")
        #expect(components.year == 2026 && components.month == 7 && components.day == 4)
    }

    @Test func dropsInvalidDate() {
        #expect(EventMapper.map(EventResponse(title: "Jazz", subtitle: "", date: "tomorrow")) == nil)
    }
}
