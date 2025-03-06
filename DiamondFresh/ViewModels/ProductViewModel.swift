import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        loadProducts()
    }

    private func loadProducts() {
        self.products = Product.sampleProducts
    }
}