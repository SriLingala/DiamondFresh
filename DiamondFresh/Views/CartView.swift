import SwiftUI

struct CartView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @ObservedObject var orderService = OrderService()
    @State private var showOrderConfirmation = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.largeTitle)
                .padding()

            List(cartViewModel.cartItems, id: \.id) { product in
                Text("\(product.name) - £\(product.price, specifier: "%.2f")")
            }

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                if cartViewModel.cartItems.isEmpty {
                    errorMessage = "❌ Your cart is empty! Add items before checking out."
                    return
                }

                guard let user = authViewModel.user else {
                    errorMessage = "❌ You must be logged in to place an order."
                    return
                }

                let customerName = user.name.isEmpty ? "Unknown Customer" : user.name
                let customerEmail = user.email  

                let order = orderService.processOrder(cartItems: cartViewModel.cartItems, customerName: customerName, customerEmail: customerEmail)

                if let order = order {
                    print("✅ Order Created: \(order)")
                    showOrderConfirmation = true
                    cartViewModel.clearCart()
                } else {
                    errorMessage = "❌ Failed to create order. Please try again."
                }
            }) {
                Text("Checkout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showOrderConfirmation) {
                Alert(
                    title: Text("Order Confirmed"),
                    message: Text("Your order has been placed successfully."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
    }
}
