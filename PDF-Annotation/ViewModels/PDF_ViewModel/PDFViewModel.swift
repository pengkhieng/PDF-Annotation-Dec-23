//
//  PDFViewModel.swift
//  PDF-Annotation
//
//  Created by Pengkhieng Kim on 10/12/23.
//
import SwiftUI

class PDFViewModel: ObservableObject {
    @Published var pdfData: Data?
    @Published var isLoading = false
    @Published var urlPDF = ""
    static let shared = PDFViewModel()
    
    func downloadPDF(from url: URL) {
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { [self] data, _, error in
            if let error = error {
                print("Error downloading PDF: \(error.localizedDescription)")
            } else if let data = data {
                DispatchQueue.main.async {
                    self.pdfData = data
                    print("========\(pdfData)============")
                    self.isLoading = false
                }
            }
        }.resume()
    }
    func getFileName( urlString: String) -> String {
        if let url = URL(string: urlString) {
            urlPDF = url.lastPathComponent
            return url.lastPathComponent
        } else {
            return "Invalid URL"
        }
        
    }
    
        // Function to retrieve file path
        func retrieveTempPDFFilePath() {
            // Use tempPDFFilePath as needed
            print("Temp PDF File Path: ")
        }
}

