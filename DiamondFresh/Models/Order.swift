import Foundation

struct Order: Identifiable, Codable {
    let id: UUID
    let customerName: String
    let items: [Product]
    let totalPrice: Double
    let orderDate: Date

    init(id: UUID = UUID(), customerName: String, items: [Product], totalPrice: Double, orderDate: Date = Date()) {
        self.id = id
        self.customerName = customerName
        self.items = items
        self.totalPrice = totalPrice
        self.orderDate = orderDate
    }
}