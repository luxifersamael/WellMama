//
//  manageImage.swift
//  B&B
//
//  Created by Mario Esposito on 28/02/24.
//

import Foundation
import SwiftUI
import UIKit

class ImageManager: ObservableObject {
    @Published var images: [UIImage?] = Array(repeating: nil, count: 40) ////
    @State var appoggio: Int = 0
    @State private var showImageFullScreen = false
    @State private var selectedImageIndex: Int?
    @State private var pickedImage: UIImage?
    @State private var showActionSheet = false
    @State private var isShowingPicker = false
    @State private var isUsingCamera = false
    
    
    init() {
        loadSavedImages()
    }

    func loadSavedImages() {
        guard let savedImageNames = UserDefaults.standard.stringArray(forKey: "savedImageNames") else { return }

        for (index, imageName) in savedImageNames.enumerated() {
            let fileURL = getImageURL(for: imageName)
            if let imageData = try? Data(contentsOf: fileURL),
               let image = UIImage(data: imageData) {
                images[index] = image
            }
        }
    }

    func deleteImage(at index: Int) {
        var savedImageNames = UserDefaults.standard.stringArray(forKey: "savedImageNames") ?? []
        guard index < savedImageNames.count else { return }

        let imageName = savedImageNames[index]
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        
        do {
            try FileManager.default.removeItem(at: fileURL)
            savedImageNames[index] = ""
        
            UserDefaults.standard.set(savedImageNames, forKey: "savedImageNames")
            
            
            // Rimuovi l'immagine solo dall'array delle immagini
            images[index] = nil
            
             // Potresti voler ricaricare o ricalcolare l'array delle immagini qui se necessario
             loadSavedImages()
        } catch {
            print("Errore nell'eliminazione dell'immagine: \(error)")
        }
    
    }

    private func getImageURL(for imageName: String) -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
    }
}


func saveImage(_ image: UIImage, withIndex index: Int) {
    guard let data = image.jpegData(compressionQuality: 1.0) else { return }
    let imageName = UUID().uuidString + ".jpg"
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)

    do {
        try data.write(to: fileURL)
        print("Immagine salvata in: \(fileURL.path)")
        
        // Aggiorna UserDefaults con il nome dell'immagine salvata
        updateSavedImageNames(with: imageName, at: index)
    } catch {
        print("Error saving image: \(error)")
    }
    
}

func updateSavedImageNames(with imageName: String, at index: Int) {
    var savedImageNames = UserDefaults.standard.stringArray(forKey: "savedImageNames") ?? []
    
    // Assicurati che l'array sia abbastanza grande da contenere l'indice specificato
    if index >= savedImageNames.count {
        // Espandi l'array con stringhe vuote per evitare errori di indice fuori range
        savedImageNames += Array(repeating: "", count: index + 1 - savedImageNames.count)
    }
    
    // Aggiorna il nome dell'immagine all'indice specificato
    savedImageNames[index] = imageName
    UserDefaults.standard.set(savedImageNames, forKey: "savedImageNames")
}
