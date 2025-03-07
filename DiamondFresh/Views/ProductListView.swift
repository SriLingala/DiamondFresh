import SwiftUI

struct ProductListView: View {
    @ObservedObject var productViewModel = ProductViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Available Products")
                    .font(.largeTitle)
                    .padding()

                List(productViewModel.products, id: \.id) { product in
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("£\(product.price, specifier: "%.2f")")
                        Button(action: {
                            cartViewModel.addToCart(product: product)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                }

                NavigationLink(destination: CartView().environmentObject(cartViewModel)) {
                    Text("Go to Cart (\(cartViewModel.cartItems.count))")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}
