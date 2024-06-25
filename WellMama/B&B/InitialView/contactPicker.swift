//
//  contactPicker.swift
//  B&B
//
//  Created by Mario Esposito on 15/03/24.
//

import Foundation
import SwiftUI
import UIKit
import ContactsUI

struct ContactPicker: UIViewControllerRepresentable {
    @Binding var selectedPhoneNumber: String
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactPicker
        
        init(_ parent: ContactPicker) {
            self.parent = parent
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                self.parent.selectedPhoneNumber = phoneNumber
                defaults.set(phoneNumber, forKey: "phone")
            }
        }
    }
}
