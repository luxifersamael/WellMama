//
//  ContentView.swift
//  B&B
//
//  Created by MattiaJ03 on 12/02/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject private var viewModel = HealthKitViewModel()
    @ObservedObject var datiUtente: userData
    @AppStorage("initialized") var initialized = false
    @State private var navigate = false // Stato per la navigazione

    var body: some View {
        if initialized {
            HouseView(datiUtente: datiUtente)
        } else {
            NavigationView {
                ZStack {
                    // Sfondo rosa chiaro per l'intera vista
                    Color.pink.opacity(0.3).edgesIgnoringSafeArea(.all)
                    
                    Image("sfondo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300) // Dimensioni dell'immagine
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2.5) // Posizione dell'immagine

                    Button(action: {
                        navigate = true // Attiva la navigazione
                    }) {
                        Text("Let's train!")
                            .bold()
                            .font(.title2)
                            .frame(minWidth: 230, minHeight: 50) // Rendi il bottone più largo e un po' più alto
                            .foregroundColor(.black) // Cambia a seconda del colore del testo desiderato
                            .background(Color.white) // Colore di sfondo del bottone
                            .clipShape(Capsule()) // Forma arrotondata del bottone
                            .shadow(radius: 7) // Opzionale: aggiunge ombra al bottone
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 1.5) // Posiziona il bottone più in alto

                    // NavigationLink nascosto per la navigazione
                    NavigationLink(destination: Credenziali(datiUtente: userData(), initialized: $initialized), isActive: $navigate) {
                        EmptyView()
                    }
                }
            }
            .onAppear {
                viewModel.requestAuthorization()
            }
        }
    }
}



#Preview {
    ContentView(datiUtente: userData())
}
