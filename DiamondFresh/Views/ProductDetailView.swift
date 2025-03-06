import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            if let imageName = product.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Text(product.name)
                .font(.largeTitle)
                .padding()
            Text("£\(String(format: "%.2f", product.price)) per \(product.quantityType)")
                .font(.title2)
            Spacer()
            Button(action: {
                cartViewModel.addToCart(product: product)
            }) {
                Text("Add to Cart")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle(product.name)
    }
}
