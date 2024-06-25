//
//  CategorieEx.swift
//  B&B
//
//  Created by MattiaJ03 on 04/03/24.
//

import Foundation
import SwiftUI
import AVKit


class EserciziManager: ObservableObject {
    @Published var eserciziCompletati: Set<String> = []
    private let lastResetDateKey = "lastResetDate"
    
    init() {
        caricaStatoCompletamento()
    }
    
    func completaEsercizio(id: String) {
        eserciziCompletati.insert(id)
        salvaStatoCompletamento()
    }
    
    func esercizioCompletato(id: String) -> Bool {
        controllaEResettaSeNecessario()
        return eserciziCompletati.contains(id)
    }
    
    private func caricaStatoCompletamento() {
        // Carica la data dell'ultimo reset
        let lastResetDate = UserDefaults.standard.object(forKey: lastResetDateKey) as? Date ?? Date()
        
        // Se non è lo stesso giorno, azzera l'elenco degli esercizi completati
        if !Calendar.current.isDateInToday(lastResetDate) {
            eserciziCompletati = []
            UserDefaults.standard.set(Date(), forKey: lastResetDateKey)
        } else {
            // Carica lo stato di completamento se è lo stesso giorno
            eserciziCompletati = Set(UserDefaults.standard.array(forKey: "eserciziCompletati") as? [String] ?? [])
        }
    }
    
    private func salvaStatoCompletamento() {
        UserDefaults.standard.set(Array(eserciziCompletati), forKey: "eserciziCompletati")
    }
    
    private func controllaEResettaSeNecessario() {
        let lastResetDate = UserDefaults.standard.object(forKey: lastResetDateKey) as? Date ?? Date()
        if !Calendar.current.isDateInToday(lastResetDate) {
            eserciziCompletati = []
            UserDefaults.standard.set(Date(), forKey: lastResetDateKey)
            UserDefaults.standard.set([], forKey: "eserciziCompletati")
        }
    }
}

//struct per immettere video
struct VideoPlayerView: UIViewControllerRepresentable {
    var videoName: String
    var videoType: String
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        if let videoPath = Bundle.main.path(forResource: videoName, ofType: videoType) {
            let videoURL = URL(fileURLWithPath: videoPath)
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            return playerViewController
        }
        // Se il video non è presente, restituisci un AVPlayerViewController vuoto
        return AVPlayerViewController()
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Aggiornamenti, se necessario
    }
}
















