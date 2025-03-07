import Foundation
import SwiftSMTP

class OrderService: ObservableObject {
    func processOrder(cartItems: [Product], customerName: String, customerEmail: String) -> Order? {
        guard !cartItems.isEmpty else {
            print("❌ ERROR: Cannot create order. Cart is empty!")
            return nil
        }

        let total = cartItems.reduce(0) { $0 + $1.price }
        let newOrder = Order(customerName: customerName, items: cartItems, totalPrice: total)

        print("✅ Order Processed Successfully: \(newOrder)")

        // Send order details via email to shop owner and customer
        sendOrderEmail(order: newOrder, customerEmail: customerEmail)

        return newOrder
    }

    /// Sends an email with the order details automatically
    func sendOrderEmail(order: Order, customerEmail: String) {
        let smtp = SMTP(
            hostname: "smtp.gmail.com",  // 🔹 Replace with your SMTP server
            email: "urbossram@gmail.com",  // 🔹 Replace with your email
            password: "ftwxblajglwpnkwg",  // 🔹 Replace with your App Password
            port: 465,  // 🔹 Use 587 for TLS, 465 for SSL
            tlsMode: .requireTLS
        )

        let from = Mail.User(name: "Diamond Fresh Mart", email: "urbossram@gmail.com") // 🔹 Your email
        let toOwner = Mail.User(name: "Shop Owner", email: "urbossram@gmail.com") // 🔹 Shop owner's email
        let toCustomer = Mail.User(name: order.customerName, email: customerEmail) // 🔹 Customer email

        var emailBody = "🛒 *New Order Received!*\n\n"
        emailBody += "👤 Customer: \(order.customerName)\n"
        emailBody += "📅 Date: \(order.orderDate)\n\n"
        emailBody += "🛍️ *Order Details:*\n"

        for product in order.items {
            emailBody += "- \(product.name) (\(product.quantityType)) - £\(String(format: "%.2f", product.price))\n"
        }

        emailBody += "\n💰 *Total:* £\(String(format: "%.2f", order.totalPrice))\n"
        emailBody += "✅ Order is ready for processing!"

        let mail = Mail(
            from: from,
            to: [toOwner, toCustomer],  // 🔹 Send email to both shop owner & customer
            subject: "🛒 New Order Received - Diamond Fresh Mart",
            text: emailBody
        )

        smtp.send(mail) { (error) in
            if let error = error {
                print("❌ ERROR: Failed to send email - \(error.localizedDescription)")
            } else {
                print("✅ Order email successfully sent to shop owner and customer!")
            }
        }
    }
}
