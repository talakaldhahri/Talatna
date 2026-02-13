import Foundation

// Helper to build a Date for a given day and time in the current calendar/timezone.
private func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int = 0) -> Date {
    var comps = DateComponents()
    comps.year = year
    comps.month = month
    comps.day = day
    comps.hour = hour
    comps.minute = minute
    return Calendar.current.date(from: comps) ?? Date()
}

let MockPlans: [Plan] = {
    // Outing date: October 12, 2025
    let outingDate = makeDate(year: 2025, month: 10, day: 12, hour: 0)

    // Stops with time windows on the same date
    let stop1 = Stop(
        id: UUID(),
        name: "Boulevard World",
        category: .amusementPark,
        priceRange: .moderate,
        location: LocationCoordinate(latitude: 24.7360, longitude: 46.6420),
        duration: 3 * 60 * 60, // 3 hours
        timeWindow: TimeWindow(
            startTime: makeDate(year: 2025, month: 10, day: 12, hour: 20, minute: 0), // 8:00 PM
            endTime: makeDate(year: 2025, month: 10, day: 12, hour: 23, minute: 0)   // 11:00 PM
        )
    )

    let stop2 = Stop(
        id: UUID(),
        name: "The Escape Hotel",
        category: .amusementPark,
        priceRange: .moderate,
        location: LocationCoordinate(latitude: 24.7136, longitude: 46.6753),
        duration: 60 * 60, // 1 hour
        timeWindow: TimeWindow(
            startTime: makeDate(year: 2025, month: 10, day: 12, hour: 23, minute: 15), // 11:15 PM
            endTime: makeDate(year: 2025, month: 10, day: 13, hour: 0, minute: 15)     // 12:15 AM next day
        )
    )

    let stop3 = Stop(
        id: UUID(),
        name: "WBJ Malqa",
        category: .restaurant,
        priceRange: .moderate,
        location: LocationCoordinate(latitude: 24.7895, longitude: 46.5960),
        duration: 60 * 60,
        timeWindow: TimeWindow(
            startTime: makeDate(year: 2025, month: 10, day: 13, hour: 0, minute: 30),  // 12:30 AM
            endTime: makeDate(year: 2025, month: 10, day: 13, hour: 1, minute: 30)     // 1:30 AM
        )
    )

    let stop4 = Stop(
        id: UUID(),
        name: "Riyadh Hills Park",
        category: .park,
        priceRange: .free,
        location: LocationCoordinate(latitude: 24.8700, longitude: 46.6000),
        duration: 60 * 60,
        timeWindow: TimeWindow(
            startTime: makeDate(year: 2025, month: 10, day: 13, hour: 1, minute: 45),  // 1:45 AM
            endTime: makeDate(year: 2025, month: 10, day: 13, hour: 2, minute: 45)     // 2:45 AM
        )
    )

    let stop5 = Stop(
        id: UUID(),
        name: "Asfoura Cafe",
        category: .cafe,
        priceRange: .cheap,
        location: LocationCoordinate(latitude: 24.7743, longitude: 46.7386),
        duration: 60 * 60,
        timeWindow: TimeWindow(
            startTime: makeDate(year: 2025, month: 10, day: 13, hour: 3, minute: 0),   // 3:00 AM
            endTime: makeDate(year: 2025, month: 10, day: 13, hour: 4, minute: 0)      // 4:00 AM
        )
    )

    // Build the Plan
    let plan = Plan(
        title: "Girls Fun Night",
        date: outingDate,
        stops: [stop1, stop2, stop3, stop4, stop5],
        imageName: "samplePlan",
        shareableLink: URL(string: "https://example.com/plan/1")!,
        isShared: true
    )

    return [plan]
}()
