import SwiftUI

struct PlanCardView: View {
    let plan: Plan

    var body: some View {
        HStack(spacing: 12) {
            Image(plan.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(14)
                .clipped()

            VStack(alignment: .leading, spacing: 6) {
                Text(plan.title)
                    .font(.headline)

                Text(plan.date)
                    .foregroundColor(.gray)

                Text(plan.time)
                    .foregroundColor(.blue)
            }

            Spacer()

            if plan.isShared {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 6)
    }
}
