//
//  PDFPreviewWrapper.swift
//  PDF-Annotation
//
//  Created by Pengkhieng Kim on 10/12/23.
//

import SwiftUI
import QuickLook

struct PDFPreviewWrapper: UIViewControllerRepresentable {
    var pdfData: Data
    var pdfFileName: String
    func makeUIViewController(context: Context) -> UINavigationController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        
        let navController = UINavigationController(rootViewController: controller)
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: context.coordinator, action: #selector(Coordinator.saveButtonTapped))
        controller.navigationItem.leftBarButtonItem = saveButton // add save button to the navigation bar
        return navController
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No-op
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(pdfData: pdfData, pdfFileName: pdfFileName)
    }
    
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        var pdfData: Data
        var pdfFileName: String
        var controller: QLPreviewController // hold a reference to the QLPreviewController
        
        init(pdfData: Data,pdfFileName: String) {
            self.pdfData = pdfData
            self.pdfFileName = pdfFileName
            self.controller = QLPreviewController()
            super.init()
        }
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        func previewController(_ controller: QLPreviewController, editingModeFor previewItem: QLPreviewItem) -> QLPreviewItemEditingMode {
                print("Edited")
                print(previewItem.previewItemURL)
                return .updateContents
            }
      
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            let fileManager = FileManager.default
            let tempDirectory = fileManager.temporaryDirectory
            let filePath = tempDirectory.appendingPathComponent(pdfFileName)

            do {
                try pdfData.write(to: filePath)
            } catch {
                print("Error writing PDF data to disk: \(error.localizedDescription)")
            }
            return filePath as QLPreviewItem
        }
        @objc func saveButtonTapped() {
            print("Save Success")
            removeTempFile()
            saveTempFile()
            
        }
        func saveTempFile() {
            let fileManager = FileManager.default
            let tempDirectory = fileManager.temporaryDirectory
            let tempFilePath = tempDirectory.appendingPathComponent(pdfFileName)

            do {
                try pdfData.write(to: tempFilePath)
                print("File saved successfully at: \(tempFilePath.path)")
            } catch {
                print("Error saving temp file: \(error.localizedDescription)")
            }
        }
        func removeTempFile() {
            let fileManager = FileManager.default
            let tempDirectory = fileManager.temporaryDirectory
            let filePath = tempDirectory.appendingPathComponent(pdfFileName)
            
            do {
                try fileManager.removeItem(at: filePath)
                print("remove file success")
            } catch {
                print("Error removing temp file: \(error.localizedDescription)")
            }
        }
    }
}
