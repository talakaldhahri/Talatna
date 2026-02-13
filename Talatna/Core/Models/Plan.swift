import Foundation

struct Plan: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var title: String
    var date: Date
    var stops: [Stop]

    // media and sharing
    var imageName: String // matches current PlanCardView usage
    var shareableLink: URL
    var isShared: Bool

    // Overall time window derived from the stops' time windows
    var timeWindow: TimeWindow {
        // Collect all non-nil start/end times from stops
        let startTimes = stops.compactMap { $0.timeWindow?.startTime }
        let endTimes = stops.compactMap { $0.timeWindow?.endTime }

        // Derive earliest start and latest end if available
        let earliestStart = startTimes.min()
        let latestEnd = endTimes.max()

        return TimeWindow(startTime: earliestStart, endTime: latestEnd)
    }

    // MARK: - UI Helpers (formatted strings to keep current views working)

    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    var timeString: String {
        guard let start = timeWindow.startTime, let end = timeWindow.endTime else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return "\(formatter.string(from: start)) - \(formatter.string(from: end))"
    }
}

// MARK: - Backward compatibility computed properties
// These allow existing PlanCardView/PlanDetailsView to compile without changes.
// They mirror the original `date` and `time` String properties.

extension Plan {
    var dateText: String { dateString }
    var timeText: String { timeString }

    // If your existing views are accessing `plan.date` and `plan.time` as String,
    // you can provide these computed properties with the same names.
    var dateDisplay: String { dateString }
    var timeDisplay: String { timeString }
}

// If you must keep exact property names `date` and `time` as String for now,
// you can add these computed properties via another extension:
// extension Plan {
//     var date: String { dateString }
//     var time: String { timeString }
// }
