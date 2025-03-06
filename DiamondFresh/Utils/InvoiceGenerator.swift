import PDFKit

class InvoiceGenerator {
    func createInvoice(order: Order) -> PDFDocument {
        let pdfDocument = PDFDocument()
        let pdfPage = PDFPage()
        pdfDocument.insert(pdfPage, at: 0)
        return pdfDocument
    }
}
