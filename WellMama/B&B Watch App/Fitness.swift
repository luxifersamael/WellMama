import SwiftUI
import WatchKit
import WatchConnectivity

struct ExerciseCounterView: View {
    @ObservedObject var manager: WatchDailyResetManager
    @State private var showingPicker = false
    @State private var exerciseCountSelection: Int = 0
    @State private var selectionMade = false
    
    var body: some View {
        VStack {
            Text("How many excersices")
                .font(.headline)
            Text("have you done today?")
                .font(.headline)
            Spacer(minLength:20)
            if selectionMade {
                Text("Esercizi selezionati: \(exerciseCountSelection)")
                    .font(.headline)
                
                Button("Save") {
                    manager.dailyCounter = exerciseCountSelection
                    selectionMade = false // Resetta per permettere una nuova selezione il giorno successivo
                    // Invia il valore aggiornato all'iPhone, se necessario
                    sendExerciseCountToiPhone(count: exerciseCountSelection)
                }
                
                .background(Color.pink)
                .foregroundColor(.black)
                .cornerRadius(10)
            } else {
                Button("Scegli numero esercizi") {
                    showingPicker = true
                }
                .font(.body)
                .sheet(isPresented: $showingPicker) {
                    // Usiamo il sheet per presentare il picker
                    NumberPicker(selectedNumber: $exerciseCountSelection, onSelectionDone: {
                        selectionMade = true
                    })
                }
            }
        }
    }
    
    func sendExerciseCountToiPhone(count: Int) {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["dailyCounter": count], replyHandler: nil, errorHandler: { error in
                print("Errore nell'invio del numero di esercizi: \(error.localizedDescription)")
            })
        }
    }
}

struct NumberPicker: View {
    @Binding var selectedNumber: Int
    let onSelectionDone: () -> Void
    
    var body: some View {
        List(0..<11) { number in
            Button("\(number)") {
                selectedNumber = number
                onSelectionDone() // Chiamata al completamento della selezione
            }
        }
    }
}

#Preview {
    ExerciseCounterView(manager:WatchDailyResetManager())
}
