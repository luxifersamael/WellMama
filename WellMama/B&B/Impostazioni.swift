//
//  Impostazioni.swift
//  B&B-Bump&Burn
//
//  Created by MattiaJ03 on 11/03/24.
//

import Foundation
import SwiftUI

struct settings: View {
    @ObservedObject var datiUtente: userData
    @State private var editedDayOfBirth: Date = Date()
    @State private var showAlert = false
    let devPassWord = "B&B"
    @State private var show = false
    @State private var userInput: String = ""
    @State private var isEditing = false

    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()

    var body: some View {
        NavigationView {
            Form{
                
                Section(header: Text("Edit Profile")) {
                    Text("Name:")
                        .font(.footnote)
                    
                    TextField("\(defaults.string(forKey: "Name") ?? "")", text: Binding(
                        get: { datiUtente.FirstName ?? "" },
                        set: { datiUtente.FirstName = $0
                        }
                    ))
                }//Fine section1
                
//                Section(header: Text("Edit Due Date")){
//                    Text("From: \(datiUtente.lBound ?? Date())")
//                    Text("To: \(datiUtente.uBound ?? Date())")
//                }//Fine section 2
//                .onAppear{
//                        datiUtente.calcolaLowerBound(dataParto: datiUtente.ultimaMestruazione)
//                            datiUtente.calcolaUpperBound(dataParto: datiUtente.ultimaMestruazione)
//                }
                
                Section(header: Text("Edit emergency contact")){
                   TextField("\(defaults.string(forKey: "phone") ?? "")", text: Binding(
                    get: { datiUtente.phoneNum ?? "" },
                    set: { datiUtente.phoneNum = $0 }
                ))
                }//Fine section 3
                
                Section(header: Text("Developer option")){
                    Button(action: {
                        show = true
                    }) {
                        Text("Enable Developer Option")
                    }
                }//Fine sezione 4
                
                if show {
                        TextField("Insert code", text: $userInput, onCommit: {
                                    // Esegui azioni quando l'utente preme invio
                                    print("Input utente: \(userInput)")
                                    show = false // Nascondi la TextField dopo l'invio
                                })
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                
                if show  == false && userInput == devPassWord {
                    Text("Developer option enabled")
                    Section(header: Text("Change currentWeek value")){
                        
                       
                        
                        HStack {
                            TextField("Insert your number", value: Binding(
                                get: { datiUtente.devWeek },
                                set: { newValue in
                                    datiUtente.devWeek = newValue
                                    defaults.set(datiUtente.devWeek, forKey: "devWeek")
                                }
                            ), formatter: NumberFormatter(), onEditingChanged: { editing in
                                isEditing = editing
                            })
                        }
                        
                    }//Fine section
                
                    }//Fine if con &&
                
            }//Fine form
        }//Fine navigation view
        .navigationBarTitle(("Settings"))
        .navigationBarItems(trailing: Button(action: {
            showAlert = true
            datiUtente.isEdited = true
            datiUtente.firstName = datiUtente.FirstName
            datiUtente.currentWeek = datiUtente.devWeek
            defaults.set(datiUtente.currentWeek, forKey: "CurrentWeek")
            defaults.set(datiUtente.phoneNum, forKey: "phone")
            defaults.set(datiUtente.FirstName, forKey: "Name")
        }, label: {
            Text("Done")
                .font(.system(size: 15))
                .foregroundColor(.blue)

        })
            .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Attention!"),
                                message: Text("This operation will overwrite your information"),
                                primaryButton: .default(Text("Confirm")) {
                                },
                                secondaryButton: .cancel()
                            )
                        }
        )
        
    }
    
    

}

#Preview{
    settings(datiUtente: userData())
}
