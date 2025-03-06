import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            List(cartViewModel.cartItems) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("£\(String(format: "%.2f", product.price))")
                }
            }
            Text("Total: £\(String(format: "%.2f", cartViewModel.calculateTotal()))")
                .font(.title)
                .padding()

            Button("Checkout") {
                // Implement Checkout functionality
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Cart")
    }
}
