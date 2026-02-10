import SwiftUI

struct PlanDetailsView: View {

    let plan: Plan

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                headerSection
                infoCardSection

            }
            .padding()
        }
    }
}
private var headerSection: some View {
    HStack {
        Text(plan.title)
            .font(.largeTitle)
            .bold()

        Spacer()
    }
}
private var infoCardSection: some View {
    VStack(alignment: .leading, spacing: 8) {

        Text("Date")
            .font(.caption)
            .foregroundColor(.gray)
        Text(plan.date)

        Divider()

        Text("Time")
            .font(.caption)
            .foregroundColor(.gray)
        Text(plan.time)
    }
    .padding()
    .background(Color(.systemGray6))
    .cornerRadius(12)
}

