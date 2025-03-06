import SwiftUI

struct OrderConfirmationView: View {
    let order: Order

    var body: some View {
        VStack {
            Text("Order Confirmation")
                .font(.title)
                .padding()

            List(order.items) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("£\(String(format: "%.2f", product.price))")
                }
            }
            Text("Total: £\(String(format: "%.2f", order.totalPrice))")
                .font(.title2)
                .padding()
        }
        .navigationTitle("Invoice")
    }
}
