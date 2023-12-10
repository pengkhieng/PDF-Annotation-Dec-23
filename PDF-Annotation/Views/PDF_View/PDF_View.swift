//
//  PDFView.swift
//  PDF-Annotation
//
//  Created by Pengkhieng Kim on 10/12/23.
//

import SwiftUI

struct PDFView: View {
    @StateObject var pdfViewModel = PDFViewModel()
    var urls = "https://icseindia.org/document/sample.pdf"
    
    var body: some View {
        VStack {
            if pdfViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.0)
            }
        }
        .onAppear {
            Task {
                guard let url = URL(string: "\(urls)") else { return }
                pdfViewModel.downloadPDF(from: url)
                pdfViewModel.getFileName(urlString: "\(url)")
                print(url)
                
            }
        }.fullScreenCover(isPresented: Binding<Bool>(get: { pdfViewModel.pdfData != nil }, set: { _ in })) {
            PDFPreviewWrapper(pdfData: pdfViewModel.pdfData!, pdfFileName: pdfViewModel.urlPDF)
        }
       
    }
}

#Preview {
    PDFView()
}
