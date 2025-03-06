import Foundation

class OrderService {
    func processOrder(cartItems: [Product], customerName: String) -> Order {
        let total = cartItems.reduce(0) { $0 + $1.price }
        return Order(customerName: customerName, items: cartItems, totalPrice: total)
    }
}
