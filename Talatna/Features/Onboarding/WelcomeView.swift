import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()

                Text("Welcome to Talatna!")
                    .font(.system(size: 28, weight: .bold))

                Text("Plan Easily. Enjoy More.")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)

                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
                    .padding(.top, 16)

                Spacer()

                NavigationLink(destination: LoginView()) {
                    Text("Sign in")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color("SecondaryColor"))
                        .cornerRadius(30)
                }
                .padding(.horizontal, 40)

                NavigationLink(destination: SignUpView()) {
                    Text("Create An Account")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 40)

                Spacer().frame(height: 40)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    WelcomeView()
}
