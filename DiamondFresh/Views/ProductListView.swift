import SwiftUI

struct ProductListView: View {
    @StateObject var productViewModel = ProductViewModel()
    @StateObject var cartViewModel = CartViewModel()

    var body: some View {
        NavigationView {
            List(productViewModel.products) { product in
                NavigationLink(destination: ProductDetailView(product: product, cartViewModel: cartViewModel)) {
                    HStack {
                        if let imageName = product.imageName {
                            Image(imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                        }
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            Text("£\(String(format: "%.2f", product.price)) per \(product.quantityType)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Diamond Fresh Mart")
        }
    }
}
