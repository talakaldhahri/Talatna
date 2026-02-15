import SwiftUI

struct SharePlanView: View {

    let plan: Plan
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {

            Text("Share Plan")
                .font(.title2)
                .bold()

            Text("Use this link to invite friends to view your Talaatna plan.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            HStack {
                Text(plan.shareableLink.absoluteString)
                    .lineLimit(1)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Button("Copy Link") {
                    UIPasteboard.general.string = plan.shareableLink.absoluteString
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Divider()

            Button("Close") {
                dismiss()
            }
            .font(.headline)
            .padding(.top, 10)
        }
        .padding()
        .presentationDetents([.medium]) // يخليه يطلع نص الشاشة
    }
}
