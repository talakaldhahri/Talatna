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
// dana replaced the plan.date in text with the below line since it caused an error
                Text(plan.date, style: .date)

                    .foregroundColor(.gray)
                // dana replaced the plan.time inside text since it deisplayed an error saying there is no value of type .time in the plan in core
                Text(plan.date, style: .time)
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
 
//#Preview {
 //   PlanCardView()
//}

