//
//  Connectivity.swift
//  B&B Watch App
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import WatchConnectivity


class WatchDailyResetManager: NSObject, ObservableObject, WCSessionDelegate {

    @Published var phoneNumber: String = UserDefaults.standard.string(forKey: "phone") ?? ""
    var session: WCSession
    @Published var dailyCounter: Int {
        didSet {
            // Salva il contatore ogni volta che viene modificato
            UserDefaults.standard.set(dailyCounter, forKey: "dailyCounter")
        }
    }
    @Published var currentWeek = UserDefaults.standard.integer(forKey: "currentWeek")

    
    override init() {
        // Leggi il valore salvato o inizializzalo a 0 se non esiste
        dailyCounter = UserDefaults.standard.integer(forKey: "dailyCounter")
        

        session = WCSession.default
        
        super.init()
        session.delegate = self
        session.activate()
        
        // Richiedi il valore attuale del contatore all'avvio
//        requestCounterValue()
//        requestPhoneNumber()
//        requestWeek()
    }
    
    func requestCounterValue() {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["requestCounter": true], replyHandler: { [weak self] reply in
                DispatchQueue.main.async {
                    self?.dailyCounter = reply["dailyCounter"] as? Int ?? 0
                    print(self?.dailyCounter)
                }
            }, errorHandler: { error in
                print("Error requesting counter value: \(error.localizedDescription)")
            })
        }
    }
    func requestWeek() {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["requestWeek": true], replyHandler: { [weak self] reply in
                DispatchQueue.main.async {
                    if let week = reply["week"] as? Int { // Assicurati che sia del tipo corretto
                        self?.currentWeek = week
                        print(self?.currentWeek)
                        UserDefaults.standard.set(week, forKey: "currentWeek") // Salvataggio della settimana corrente
                    }
                }
            }, errorHandler: { error in
                print("Error requesting week: \(error.localizedDescription)")
            })
        }
    }
    func requestPhoneNumber() {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["requestPhone": true], replyHandler: { [weak self] reply in
                DispatchQueue.main.async {
                    if let phone = reply["phoneNumber"] as? String {
                        self?.phoneNumber = phone
                        UserDefaults.standard.set(phone, forKey: "phone") // Salvataggio del numero di telefono
                        print(self?.phoneNumber)
                    }
                }
            }, errorHandler: { error in
                print("Error requesting phone number: \(error.localizedDescription)")
            })
        }
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {}


    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            requestCounterValue()
//            requestPhoneNumber()
//            requestWeek()
            print("activate")
        case .inactive:
            print("inactive")
        case .notActivated:
            print("notacivate")
        default:
            print("default")
        }
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) { }
       

    // Metodi delegati WCSession
}
