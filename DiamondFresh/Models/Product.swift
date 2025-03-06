import Foundation

struct Product: Identifiable, Codable {
    let id: UUID
    let name: String
    let price: Double
    let quantityType: String // e.g., "kg", "dozen", "pack"
    let stock: Int
    let imageName: String? // Image file name

    init(id: UUID = UUID(), name: String, price: Double, quantityType: String, stock: Int, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.price = price
        self.quantityType = quantityType
        self.stock = stock
        self.imageName = imageName
    }
}

// Sample data
extension Product {
    static let sampleProducts: [Product] = [
        Product(name: "Tomatoes", price: 1.99, quantityType: "kg", stock: 10, imageName: "tomatoes")
        ]
}
