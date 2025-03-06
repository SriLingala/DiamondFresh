import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [Product] = []

    func addToCart(product: Product) {
        cartItems.append(product)
    }

    func removeFromCart(product: Product) {
        cartItems.removeAll { $0.id == product.id }
    }

    func calculateTotal() -> Double {
        return cartItems.reduce(0) { $0 + $1.price }
    }
}
