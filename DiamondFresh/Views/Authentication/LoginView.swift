import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showSignUp = false  // 🔹 State to control navigation to Sign Up

    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                authViewModel.login(email: email, password: password) { success in
                    if !success {
                        errorMessage = authViewModel.errorMessage ?? "Login failed"
                    }
                }
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // 🔹 "Sign Up" Button to navigate to Sign Up screen
            Button(action: {
                showSignUp = true
            }) {
                Text("Don't have an account? Sign Up")
                    .foregroundColor(.blue)
            }
            .padding()
            .sheet(isPresented: $showSignUp) { // 🔹 Open Sign Up screen
                SignUpView().environmentObject(authViewModel)
            }
        }
        .padding()
    }
}
