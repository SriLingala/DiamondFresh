import Foundation

class Formatter {
    static func currencyString(_ value: Double) -> String {
        return String(format: "£%.2f", value)
    }
}
