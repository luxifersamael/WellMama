//
//  GlobalData.swift
//  B&B-Bump&Burn
//
//  Created by MattiaJ03 on 11/03/24.
//

import Foundation
import BackgroundTasks
import SwiftUI

let defaults = UserDefaults.standard

func incrementaSettimaneGravidanza() {
    // Ottieni il valore corrente di currentWeeks e la data dell'ultimo incremento
    var currentWeeks = defaults.integer(forKey: "CurrentWeek")
    let ultimaDataIncremento = defaults.object(forKey: "ultimaDataIncremento") as? Date ?? Date()
    
    // Calcola la differenza in settimane dalla data dell'ultimo incremento
    let calendario = Calendar.current
    let componenti = calendario.dateComponents([.day], from: ultimaDataIncremento, to: Date())
    let giorniPassati = componenti.day ?? 0
    
    // Verifica se sono passati almeno 7 giorni (1 settimana)
    if giorniPassati >= 7 && currentWeeks < 40 {
        // Incrementa currentWeeks di 1
        currentWeeks += 1
        
        // Aggiorna currentWeeks e la data dell'ultimo incremento in UserDefaults
        defaults.set(currentWeeks, forKey: "CurrentWeek")
        defaults.set(Date(), forKey: "ultimaDataIncremento")
        
        print("currentWeeks aggiornato a: \(currentWeeks)")
    } else {
        print("Non è ancora il momento di incrementare currentWeeks o il limite di 40 settimane è stato raggiunto.")
    }
}


class userData: ObservableObject {
    @Published var userFeeling: String? = UserDefaults.standard.string(forKey: "userFeeling")
    @Published var userFeeling2: String? = UserDefaults.standard.string(forKey: "userFeeling2")
     
    @Published var firstName = defaults.string(forKey: "Name")
    @Published var FirstName = defaults.string(forKey: "Name")
    @Published var isEdited = false
    @Published var phoneNum = defaults.string(forKey: "phone")
    @Published var ultimaMestruazione = defaults.object(forKey: "UltimaMestruazione") as? Date ?? Date()
    @Published var currentWeek = defaults.integer(forKey: "CurrentWeek")
    @Published var devWeek = defaults.integer(forKey: "devWeek")
   
    @Published var lBound = defaults.object(forKey: "lBound") as? Date
    @Published var uBound = defaults.object(forKey: "uBound") as? Date

    
    
    var trimestre: Int = 1
    
    
    func scheduleNotification(hour: Int, minute: Int, message: String) {
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = "Bump&Burn" // Titolo predefinito
            content.body = message
            content.sound = .default
            
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // Registra la richiesta di notifica con il centro notifiche
            center.add(request) { error in
                if let error = error {
                    print("Errore nella programmazione della notifica per le \(hour):\(minute): \(error.localizedDescription)")
                } else {
                    print("Notifica programmata con successo per le \(hour):\(minute)")
                }
            }
        }
    
    
    func calcolaTrimestre(currentWeek: Int) -> Int {
            switch currentWeek {
            case ...12:
                return 1
            case 13...24:
                return 2
            case 25...36:
                return 3
            default:
                return 4
            }
        }
    
    
    func showTB(currentWeek: Int) -> some View {
            switch currentWeek {
            case ...10:
                return AnyView(TB1())
            case 11...20:
                return AnyView(TB2())
            case 21...30:
                return AnyView(TB3())
            case 31...40:
                return AnyView(TB4())
            default:
                return AnyView(TB4())
            }
        }

    
    //    function per il calcolo della settimana attuale di gravidanza
    
    func updateCurrentWeek() {
        let calendar = Calendar.current
        
        if let weeks = calendar.dateComponents([.weekOfYear], from: ultimaMestruazione, to: Date()).weekOfYear {
            let newCurrentWeek = max(1, weeks + 1)
            currentWeek = newCurrentWeek
            defaults.set(newCurrentWeek, forKey: "CurrentWeek")
        }
    }
    
   
    // Funzione per calcolare il lowerBound
    func calcolaLowerBound(dataParto: Date) {
        let calendar = Calendar.current
        let nineMonthsComponents = DateComponents(month: 9)
        let nineMonthsLater = calendar.date(byAdding: nineMonthsComponents, to: dataParto)
        
        // Sottrai 7 giorni dalla data a 9 mesi
        if let lowerBound = calendar.date(byAdding: .day, value: -7, to: nineMonthsLater ?? Date()) {
            lBound = lowerBound
        }
    }

       // Funzione per calcolare l'upperBound
    func calcolaUpperBound(dataParto: Date) {
        let calendar = Calendar.current
        let nineMonthsComponents = DateComponents(month: 9)
        let nineMonthsLater = calendar.date(byAdding: nineMonthsComponents, to: dataParto)
        
        // Aggiungi 7 giorni alla data a 9 mesi
        if let upperBound = calendar.date(byAdding: .day, value: 7, to: nineMonthsLater ?? Date()) {
            uBound = upperBound
        }
    }
    
    
    
    
    
    
    // Function to format Date to String
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    // Function to parse String to Date
    func formatDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.date(from: dateString)
    }
    
}







