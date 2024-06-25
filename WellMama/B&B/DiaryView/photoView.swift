//
//  photoView.swift
//  B&B
//
//  Created by Mario Esposito on 28/02/24.
//

import Foundation
import SwiftUI
import UIKit

class ImageSaver: NSObject {
    static let shared = ImageSaver()
    
    func saveImageToPhotoAlbum(image: UIImage, completion: @escaping () -> Void) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(handleImageSave(_:didFinishSavingWithError:contextInfo:)), nil)
        self.completionHandler = completion
    }
    
    private var completionHandler: (() -> Void)?
    
    @objc private func handleImageSave(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        DispatchQueue.main.async {
            if let error = error {
                // Errore nel salvataggio
                print("Error, cannot save the image: \(error.localizedDescription)")
            } else {
                // Salvataggio riuscito, chiama il completion handler
                self.completionHandler?()
                print("Image saved successfully")
            }
            self.completionHandler = nil // Reset del completion handler
        }
    }
}



struct FullScreenImageView: View {
    var image: UIImage?
    var index: Int // Assicurati di passare l'indice dell'immagine quando crei questa vista
    var onDelete: ((Int) -> Void)?
    @State private var showingSaveAlert = false
    @State private var showingConfirmationDialog = false
    @State private var showingDeleteConfirmation = false

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 250, minHeight: 250)
                    .shadow(radius: 30, x: 30, y: 50)
                
                // Bottoni per eliminare l'immagine
                Button("Delete") {
                    showingDeleteConfirmation = true
                }
                .foregroundColor(.red)
                .padding()
                .confirmationDialog("Are you sure you wanna delete the image?", isPresented: $showingDeleteConfirmation) {
                    Button("Delete", role: .destructive) {
                        onDelete?(index) // Chiama la closure di eliminazione passata da ContentView
                    }
                } message: {
                    Text("This operation cannot be undone")
                }
                
            } else {
                Text("No image")
            }
        }//fine vstack
        .navigationBarItems(trailing:
                                VStack{
                                Button(action: {
            // Mostra il dialogo di conferma prima di salvare
            self.showingConfirmationDialog = true
        }) {
            Text("Save")
                .foregroundColor(.blue)
                .position(x:30,y:10)
        }
            .padding()
            .confirmationDialog("Do you want to save the image?", isPresented: $showingConfirmationDialog) {
                Button("Save", role: .destructive) {
                    ImageSaver.shared.saveImageToPhotoAlbum(image: image!) {
                                            self.showingSaveAlert = true // Mostra l'alert dopo il salvataggio
                                        }
                }
            } message: {
                Text("This operation will save the image in your gallery")
            }
        }//Fine vstack interna
        )
        .edgesIgnoringSafeArea(.all)
        .alert("Image saved!", isPresented: $showingSaveAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("The image was successfully saved in your gallery!")
        }
      
    }
}
