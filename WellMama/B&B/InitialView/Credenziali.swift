//
//  Credenziali.swift
//  B&B
//
//  Created by MattiaJ03 on 12/02/24.
//

import Foundation
import SwiftUI

struct Credenziali: View {
    @ObservedObject var datiUtente: userData
    //variabile collegata la button save per mostrare solo una volta la schermata delle credenziali
    @Binding var initialized: Bool
    @State private var showManualInput = false
    @State private var conoscenzaDataNascita: Bool?
    @State private var showCalculatedData = false
    @State private var showingContactPicker = false
    @State private var selectedPhoneNumber: String = ""
    @State private var contactAdded = false
    @State private var manualPhoneNumber = ""
    @State private var showingOptionsSheet = false
    @State private var notificationAuthorized = false
    @State private var showingConfirmationAlert = false
    @State private var show = false
    @State private var showingPhoneNumberConfirmationAlert = false
    
    var isFormComplete: Bool {
        guard let firstName = datiUtente.firstName, !firstName.isEmpty,
              !selectedPhoneNumber.isEmpty else {
            return false
        }
        // Qui puoi aggiungere ulteriori controlli per altri campi se necessario
        return true
    }
    //variabile per l'aggiunta del numero(da rendere obbligatorio)
    var contactAddedText: String {
        if selectedPhoneNumber.isEmpty {
            return "No emergency contact added \nYou can add it later Settings > Edit emergency contact"
        } else {
            return "Number added"
        }
    }
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                TextField("Insert your name", text: Binding(
                    get: { datiUtente.firstName ?? "" },
                    set: {
                        datiUtente.firstName = $0
                        defaults.set(datiUtente.firstName, forKey: "Name")
                    }
                    
                ))
                .padding()
                
                DatePicker("When was your last cycle?", selection: $datiUtente.ultimaMestruazione, in: ...Date(), displayedComponents: .date)
                    .padding()
                
                VStack{
                    Text("Do you know the baby's due Date?")
                    
                    HStack {
                        Button("Yes") {
                            conoscenzaDataNascita = true
                        }
                        .padding()
                        
                        Button("No") {
                            conoscenzaDataNascita = false
                        }
                        .padding()
                    }//Fine hstack interna dei bottoni
                    
                }//Fine vstack estrena con il text
                
                //if-else per il calcolo della data di nascita del bambino
                if let conoscenzaDataNascita = conoscenzaDataNascita {
                    if conoscenzaDataNascita {
                        Text("Wonderful!")
                        .padding()
                    } else {
                        
                        HStack{
                            Text("Leave it to us!")
                            .padding()
                                        
                            Button("Calculate date") {
                                datiUtente.calcolaLowerBound(dataParto: datiUtente.ultimaMestruazione)
                                    datiUtente.calcolaUpperBound(dataParto: datiUtente.ultimaMestruazione)
                                datiUtente.updateCurrentWeek()
                                showCalculatedData = true
                                    }
                                    .padding()
                        }//fine hstack
                        
                        if showCalculatedData {
                            Text("Your baby might be born:")
                            Text("From: \(dateFormatter.string(from: datiUtente.lBound ?? Date()))")
                            Text("To: \(dateFormatter.string(from: datiUtente.uBound ?? Date()))")
                                        }
                        
                    }//fine else interno
            }//fine if esterno

                
                //Button per l'invio delle notifiche
                
                VStack {
                    if !contactAdded {
                        Text("You must insert an emergency number in case of emergency")
                            .padding()
                        
                        if !showManualInput {
                            Button("Choose how to insert it") {
                                showingOptionsSheet = true
                            }
                            .padding()
                        }
                    } else {
                        Text("Number added: \(selectedPhoneNumber)")
                            .padding()
                    }
                    
                    if showManualInput {
                        TextField("Emergency contact", text: $selectedPhoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        // Aggiungi qui un eventuale bottone "Conferma"
                    }
                }
                .actionSheet(isPresented: $showingOptionsSheet) {
                    ActionSheet(title: Text("Select an option"), buttons: [
                        .default(Text("Insert manually")) {
                            showManualInput = true
                        },
                        .default(Text("Choose from contacts")) {
                            showingContactPicker = true
                        },
                        .cancel()
                    ])
                }
                .sheet(isPresented: $showingContactPicker, onDismiss: {
                    if !selectedPhoneNumber.isEmpty {
                        showingPhoneNumberConfirmationAlert = true
                    }
                }) {
                    ContactPicker(selectedPhoneNumber: $selectedPhoneNumber)
                }
                .alert(isPresented: $showingPhoneNumberConfirmationAlert) {
                    Alert(
                        title: Text("Confirm Phone Number"),
                        message: Text("Number selected: \(selectedPhoneNumber). Do you want to add this number?"),
                        primaryButton: .default(Text("Confirm")) {
                            contactAdded = true
                            defaults.set(selectedPhoneNumber, forKey: "phone")
                            DailyResetManager.shared.sendPhoneNumberToWatch()
                        },
                        secondaryButton: .cancel()
                    )
                }
                
                
                
                
                Button("Enable Notification") {
                    self.handleNotification()
                }
                .padding(30)
                .font(.system(size: 20))
                .onAppear {
                    self.checkNotificationAuthorization()
                }
                
                
                
            }
            .multilineTextAlignment(.leading)//fine scrollview
            .navigationBarTitle(Text("Add your information"))
            .navigationBarItems(trailing: Button(action: {
                finalizeSetup()
            }, label: {
                Text("Done")
                    .font(.system(size: 20))
                    .foregroundColor(isFormComplete ? .blue : .gray)

            })
                .disabled(!isFormComplete))
            
            
            
        }//fine navigation view
        
    }//fine body

func finalizeSetup() {
    initialized = true
    datiUtente.updateCurrentWeek()
    defaults.set(datiUtente.firstName, forKey: "Name")
    defaults.set(datiUtente.ultimaMestruazione, forKey:"lastCycle")
}

//Funzioni per il funzionamento delle notifiche
func handleNotification() {
    if !notificationAuthorized {
        self.requestNotificationAuthorization()
    } else {
        self.scheduleNotificationAfterDelay()
        self.scheduleDailyNotifications()
    }
}

func requestNotificationAuthorization() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("authorized")
            self.notificationAuthorized = true
            self.handleNotification() // Schedule notifications once authorization is granted
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
}

func checkNotificationAuthorization() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
        DispatchQueue.main.async {
            self.notificationAuthorized = settings.authorizationStatus == .authorized
        }
    }
}

func scheduleNotificationAfterDelay() {
    guard notificationAuthorized else {
        print("Notifications not authorized.")
        return
    }
    
    let content = UNMutableNotificationContent()
    content.title = "WellMama"
    content.body = "Welcome \(UserDefaults.standard.string(forKey: "Name") ?? "")!"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        }
    }
}

    func scheduleDailyNotifications() {
        guard notificationAuthorized else {
            print("Notifications not authorized.")
            return
        }
        
        let contentMorning = UNMutableNotificationContent()
        contentMorning.title = "WellMama"
        contentMorning.subtitle = "Goodmorning!"
        contentMorning.body = "How are you today? Let us know!"
        contentMorning.sound = UNNotificationSound.default
        
        var dateComponentsMorning = DateComponents()
        dateComponentsMorning.hour = 10 // Imposta l'ora della notifica del mattino
        dateComponentsMorning.minute = 0 // Imposta i minuti della notifica del mattino
        
        let triggerMorning = UNCalendarNotificationTrigger(dateMatching: dateComponentsMorning, repeats: true)
        let requestMorning = UNNotificationRequest(identifier: UUID().uuidString, content: contentMorning, trigger: triggerMorning)
        
        UNUserNotificationCenter.current().add(requestMorning) { error in
            if let error = error {
                print("Error scheduling morning notification: \(error.localizedDescription)")
            }
        }
        
        let contentEvening = UNMutableNotificationContent()
        contentEvening.title = "WellMama"
        contentEvening.subtitle = "Good afternoon!"
        contentEvening.body = "It's time to some exercice"
        contentEvening.sound = UNNotificationSound.default
        
        var dateComponentsEvening = DateComponents()
        dateComponentsEvening.hour = 15 // Imposta l'ora della notifica della sera
        dateComponentsEvening.minute = 30 // Imposta i minuti della notifica della sera
        
        let triggerEvening = UNCalendarNotificationTrigger(dateMatching: dateComponentsEvening, repeats: true)
        let requestEvening = UNNotificationRequest(identifier: UUID().uuidString, content: contentEvening, trigger: triggerEvening)
        
        UNUserNotificationCenter.current().add(requestEvening) { error in
            if let error = error {
                print("Error scheduling evening notification: \(error.localizedDescription)")
            }
        }
        
    }
}//Fine view

#Preview{
    Credenziali(datiUtente: userData(), initialized: .constant(false))
}
