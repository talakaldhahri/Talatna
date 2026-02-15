import SwiftUI
import MapKit

struct PlanDetailsView: View {

    let plan: Plan
    @State private var showShareSheet = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: 16) {

                    HStack(alignment: .top, spacing: 16) {

                        // صورة الخطة
                        Image(plan.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                        VStack(alignment: .leading, spacing: 8) {

                            detailRow(title: "Date:", value: plan.dateText)

                            detailRow(title: "Time:", value: plan.timeText)

                            detailRow(title: "Stops:", value: "\(plan.stops.count) stops")

                            detailRow(title: "Duration:", value: totalDurationText())
                        }

                        Spacer()
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 20))

                // MARK: - Locations Section
                VStack(alignment: .leading, spacing: 16) {

                    Text("Locations")
                        .font(.title2)
                        .bold()

                    ForEach(plan.stops) { stop in
                        locationRow(stop: stop)
                    }
                }

                // MARK: - Map Placeholder (UI Only)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "map.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    )
            }
            .padding()
        }
        .navigationTitle(plan.title)
        .navigationBarTitleDisplayMode(.inline)

        // MARK: - Share Button
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showShareSheet = true
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }

        // MARK: - Share Sheet
        .sheet(isPresented: $showShareSheet) {
            SharePlanView(plan: plan)
        }
    }

    // MARK: - Helpers

    func detailRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .bold()
            Text(value)
                .foregroundColor(.gray)
        }
    }

    func locationRow(stop: Stop) -> some View {
        HStack(alignment: .top, spacing: 12) {

            Image(systemName: "mappin.circle.fill")
                .foregroundColor(.orange)
                .font(.system(size: 24))

            VStack(alignment: .leading) {
                Text(stop.name)
                    .bold()

                Text(stop.durationText)
                    .foregroundColor(.blue)
            }

            Spacer()
        }
    }

    func totalDurationText() -> String {
        let totalSeconds = plan.stops.compactMap { $0.duration }.reduce(0, +)
        let hours = Int(totalSeconds / 3600)
        return hours > 0 ? "\(hours) hours" : ""
    }
}
