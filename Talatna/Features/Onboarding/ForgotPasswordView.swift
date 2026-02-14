import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 60)

                    Text("Forgot Password")
                        .font(.system(size: 28, weight: .bold))

                    Text("Enter your email to reset password")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)

                    TextField("Email Address", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.top, 8)

                    NavigationLink(destination: ResetPasswordView()) {
                        Text("Reset password")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color("SecondaryColor"))
                            .cornerRadius(30)
                    }

                    HStack(spacing: 4) {
                        Text("Remembered your password?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Button("Sign in") { dismiss() }
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color("SecondaryColor"))
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
}

#Preview {
    NavigationStack {
        ForgotPasswordView()
    }
}
