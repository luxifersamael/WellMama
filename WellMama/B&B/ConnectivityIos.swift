//
//  CountEx.swift
//  B&B
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import WatchConnectivity

class DailyResetManager: NSObject, WCSessionDelegate {
    static let shared = DailyResetManager()
    var session: WCSession
    private override init() {
        session = WCSession.default
        super.init()
        session.delegate = self
        session.activate()
        
    }
    
    private let lastResetKey = "lastResetDate"
    private let counterKey = "dailyCounter"
    
    private var lastResetDate: Date? {
        get {
            UserDefaults.standard.object(forKey: lastResetKey) as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: lastResetKey)
        }
    }
    
    var dailyCounter: Int {
        get {
            UserDefaults.standard.integer(forKey: counterKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: counterKey)
        }
    }
    
    func checkAndResetCounter() {
        guard let lastReset = lastResetDate else {
            lastResetDate = Date()
            return
        }
        
        if !Calendar.current.isDateInToday(lastReset) {
            dailyCounter = 0
            lastResetDate = Date()
        }
    }
    
    // MARK: - WCSessionDelegate
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    // Nel DailyResetManager dell'iPhone

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let newCounter = message["dailyCounter"] as? Int {
            self.dailyCounter = newCounter
            self.checkAndResetCounter() // Verifica e resetta se necessario
        } else if message["requestCounter"] as? Bool == true {
            replyHandler(["dailyCounter": dailyCounter])
        } else if message["requestPhone"] as? Bool == true {
            // Invia il numero di telefono al Watch
            let phoneNumber = UserDefaults.standard.string(forKey: "phone") ?? ""
            replyHandler(["phoneNumber": phoneNumber])
        
        } else if message["requestWeek"] as? Bool == true {
            let weekcurrent = defaults.integer(forKey: "CurrentWeek")
            replyHandler(["week": weekcurrent])
        }
    }


    func requestResetCounter() {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["resetRequest": true], replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    func sendPhoneNumberToWatch() {
        let phoneNumber = UserDefaults.standard.string(forKey: "phone") ?? ""
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["phoneNumber": phoneNumber], replyHandler: nil, errorHandler: { error in
                print("Error sending phone number: \(error.localizedDescription)")
            })
        }
    }
    // Queste due funzioni possono rimanere vuote se non hai bisogno di gestirle.
    func sessionDidBecomeInactive(_ session: WCSession) { }
    func sessionDidDeactivate(_ session: WCSession) { }
}


