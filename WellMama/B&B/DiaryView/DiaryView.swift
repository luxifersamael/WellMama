//  DiaryView.swift
//  B&B
//
//  Created by Mario Esposito on 28/02/24.
//

import SwiftUI
import Foundation

struct DiaryView: View {
    @StateObject private var imageManager = ImageManager()
    @State private var isShowingPicker = false
    @State private var isUsingCamera = false
    @State private var pickedImage: UIImage?
//    @State private var selectedButtonIndex: Int?
    @State private var showActionSheet = false
    @State private var showImageFullScreen = false
    @State private var selectedImageIndex: Int = 0


    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 30)
                
                Text("Take a picture every week!")
                    .font(.title)
                    .padding()
                
                
                ScrollView {
                    
                    Spacer(minLength: 100)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(0..<40, id: \.self) { index in ////
                            VStack {
                                if let image = imageManager.images[index] {
                                    NavigationLink(destination: FullScreenImageView(
                                        image: image,
                                        index: index,
                                        onDelete: { indexToDelete in
                                            self.imageManager.deleteImage(at: indexToDelete)
                                            self.showImageFullScreen = false
                                        }
                                    ), label: {
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                            .cornerRadius(10)
                                    })
                                } else {
                                    Button(action: {
                                        self.selectedImageIndex = index
                                        self.showActionSheet = true
                                    }) {
                                        VStack {
                                            Image(systemName: "camera")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            Text("Week \(index + 1)")
                                                .font(.headline)
                                        }
                                        .frame(width: 150, height: 150)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                            Spacer(minLength: 50)
                    }
                }
            }

            .onAppear {
                imageManager.loadSavedImages()
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Select an image"), message: nil, buttons: [
                    .default(Text("Take a picture")) {
                        self.isUsingCamera = true
                        self.isShowingPicker = true
                    },
                    .default(Text("Choose from gallery")) {
                        self.isUsingCamera = false
                        self.isShowingPicker = true
                    },
                    .cancel()
                ])
            }
            .sheet(isPresented: $isShowingPicker) {
                ImagePicker(image: self.$pickedImage, sourceType: self.isUsingCamera ? .camera : .photoLibrary)
                    .onDisappear {
                        if let pickedImage = self.pickedImage {
                            saveImage(pickedImage, withIndex: selectedImageIndex)
                            imageManager.images[selectedImageIndex] = pickedImage
                        }
                    }
            }
        }

        
    }
    
}



struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
