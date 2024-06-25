//
//  prove.swift
//  B&B
//
//  Created by MattiaJ03 on 06/03/24.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var firstName: String {
        didSet {
            defaults.set(firstName, forKey: "Name")
        }
    }
    
    @Published var editedFirstName: String {
        didSet {
            defaults.set(editedFirstName, forKey: "editedName")
        }
    }
    
    init() {
        self.firstName = defaults.string(forKey: "Name") ?? ""
        self.editedFirstName = defaults.string(forKey: "editedName") ?? ""
    }
}

struct Conte: View {
    @StateObject private var viewModel = ViewModel()
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            TextField("Enter First Name", text: $viewModel.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .disabled(isEditing)
            
            
            if isEditing {
                TextField("Edit First Name", text: $viewModel.editedFirstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            Button(action: {
                if isEditing {
                    viewModel.firstName = viewModel.editedFirstName
                    isEditing = false
                } else {
                    isEditing = true
                }
            }) {
                Text(isEditing ? "Done" : "Edit")
            }
            
            Text("Current Name: \(isEditing ? viewModel.editedFirstName : viewModel.firstName)")
                .padding()
        }
        .padding()
    }
}

#Preview{
    Conte()
}
