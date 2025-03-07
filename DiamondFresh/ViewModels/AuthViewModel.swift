import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading = true  // ✅ Added loading state

    init() {
        checkUserSession()
    }

    func checkUserSession() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.user = user
            self.isLoading = false  // ✅ Hide loading when check is complete
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("❌ Sign out error: \(error.localizedDescription)")
        }
    }
}
