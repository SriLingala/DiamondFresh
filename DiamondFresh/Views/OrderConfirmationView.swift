import SwiftUI

struct OrderConfirmationView: View {
    let order: Order  // ✅ Order should now always be passed correctly

    var body: some View {
        VStack {
            Text("✅ Order Confirmed!")
                .font(.title)
                .padding()

            if order.items.isEmpty {
                Text("❌ No items in the order!")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
            } else {
                List(order.items) { product in
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("£\(String(format: "%.2f", product.price))")
                    }
                }
            }

            Text("Total: £\(String(format: "%.2f", order.totalPrice))")
                .font(.title2)
                .padding()
        }
        .navigationTitle("Invoice")
        .onAppear {
            print("📄 OrderConfirmationView Loaded: \(order)")
        }
    }
}
