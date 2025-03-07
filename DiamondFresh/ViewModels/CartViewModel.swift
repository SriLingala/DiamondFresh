import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [Product] = []

    func addToCart(product: Product) {
        cartItems.append(product)
    }

    func clearCart() {
        cartItems.removeAll()
    }
}
