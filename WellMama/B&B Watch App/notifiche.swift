//
//  notifiche.swift
//  B&B Watch App
//
//  Created by MattiaJ03 on 18/03/24.
//

import Foundation
import SwiftUI
import UserNotifications
import WatchConnectivity




class notificationManager {
    static let shared = notificationManager()
    @AppStorage("notificationAuthorized") var notificationAuthorized: Bool = false
        
        init() {
            // Verifica se è il primo avvio dell'app
            if UserDefaults.standard.object(forKey: "notificationAuthorized") == nil {
                // Imposta la variabile notificationAuthorized su false al primo avvio
                UserDefaults.standard.set(false, forKey: "notificationAuthorized")
            }
        }
    
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
    
    func handleNotification() {
       
        if !notificationAuthorized {
            requestNotificationAuthorization()
        } else {
            scheduleNotification()
        }
    }

    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if success {
                print("authorized")
                self.notificationAuthorized = true
                self.scheduleNotification()
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

    func scheduleNotification() {
        guard notificationAuthorized else {
            print("Notifications not authorized.")
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Bump&Burn"
        content.body = "Welcome to B$B!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.parth.01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }

}
