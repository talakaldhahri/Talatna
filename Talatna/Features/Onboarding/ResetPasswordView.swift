import SwiftUI

struct ResetPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 40)

                    Text("Reset Your Password")
                        .font(.system(size: 28, weight: .bold))

                    Text("Enter a new password to reset the password on your account.")
                        .font(.system(size: 15))
                        .foregroundColor(Color("SecondaryColor"))
                        .multilineTextAlignment(.center)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("New password")
                            .font(.system(size: 15, weight: .medium))

                        SecureField("", text: $newPassword)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )

                        VStack(alignment: .leading, spacing: 4) {
                            requirementRow("Must be at least 15 character long")
                            requirementRow("Must contain an uppercase and a lowercase letter (A, z)")
                            requirementRow("Must contain a number")
                            requirementRow("Must contain a special character (!, %, @, #, etc.)")
                        }
                        .padding(.top, 2)
                    }
                    .padding(.top, 8)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Confirm new password")
                            .font(.system(size: 15, weight: .medium))

                        SecureField("", text: $confirmPassword)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }

                    Button(action: {}) {
                        Text("Reset password")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color("SecondaryColor"))
                            .cornerRadius(30)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                HStack(spacing: 6) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .cornerRadius(6)
                    Text("Talatna")
                        .font(.system(size: 18, weight: .semibold))
                }
            }
        }
    }

    private func requirementRow(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: "circle")
                .font(.system(size: 6))
                .foregroundColor(Color("SecondaryColor"))
                .padding(.top, 5)
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    NavigationStack {
        ResetPasswordView()
    }
}
