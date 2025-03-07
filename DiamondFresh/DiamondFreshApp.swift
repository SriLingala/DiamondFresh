import SwiftUI
import Firebase

@main
struct DiamondFreshApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var cartViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authViewModel.isLoading {
                    ProgressView("Loading...")  // ✅ Show loading while checking authentication
                } else if authViewModel.user != nil {
                    ProductListView()
                        .environmentObject(authViewModel)
                        .environmentObject(cartViewModel)
                } else {
                    LoginView()
                        .environmentObject(authViewModel)
                        .environmentObject(cartViewModel)
                }
            }
        }
    }
}
