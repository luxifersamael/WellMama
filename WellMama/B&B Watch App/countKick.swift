import SwiftUI

struct CounterData: Identifiable {
    var id = UUID()
    var count: Int
    var date: Date
}

struct CounterView: View {
    @State private var count = 0
    @State private var counterDataList: [CounterData] = []
    @State private var showHistory = false
    @State private var showCounterLabel = true
    @State private var showAlert = false
    @ObservedObject var manager: WatchDailyResetManager
    @State private var phoneNumber: String = ""
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 35, height: 35)
                .overlay(
                    Image(systemName: "cross.case")
                        .resizable()
                        .frame(width: 20, height: 20)
                )
                .onLongPressGesture(minimumDuration: 0.0) {
                    // Questa è la funzione che vuoi chiamare con un long press
                    makePhoneCall()
                }
                .position(x:12, y:-12)
            Spacer()
            if showCounterLabel {
                Text("Kick: \(count)")
                    .font(.headline)
                    .padding(.top, -90)
            }

            ZStack {
                ForEach(0..<count, id: \.self) { index in
                    Circle()
                        .fill(Color(red: 0xFF / 255, green: 0xc0 / 255, blue: 0xcb / 255))
                        .frame(width: 10, height: 10)
                        .padding(.top, -30)
                        .offset(
                            x: cos(Double(index) * 2 * .pi / Double(count)) * 70,
                            y: sin(Double(index) * 2 * .pi / Double(count)) * 70
                        )
                }

                Button(action: {
                    self.incrementCounter()
                }) {
                    Image("sfondo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top, -50)

                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: {
                            // Azione per il pulsante destro
                            self.saveCounterData()
                            self.showAlert = true
                        }) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color(red: 0xFF / 255, green: 0xc0 / 255, blue: 0xcb / 255))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: 1, y: 25)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Kick saved"), message: Text(" "), dismissButton: .default(Text("OK")))
                        }
                    }
                }

                HStack {
                    VStack {
                        Spacer()
                        Button(action: {
                            // Azione per il pulsante sinistro
                            self.showHistory.toggle()
                            self.showCounterLabel.toggle()
                        }) {
                            Image(systemName: "list.clipboard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color(red: 0xFF / 255, green: 0xc0 / 255, blue: 0xcb / 255))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: -1, y: 25)
                    }
                    Spacer()
                }
            }

            if showHistory {
                List(counterDataList) { data in

                    VStack(alignment: .leading) {
                        Text("Kick Counter: \(data.count)")
                        Text("Date: \(formattedDate(date: data.date))")
                            .font(.caption)
                    }
                }
                .offset(x: 0, y: 25)
            }
        }
        .padding()
        .onAppear {
            // Assegna il numero di telefono dal manager al phoneNumber state
            phoneNumber = manager.phoneNumber
            manager.requestCounterValue()
            // Se il numero non è già disponibile, richiedilo
            if phoneNumber.isEmpty {
                manager.requestPhoneNumber()
                phoneNumber = manager.phoneNumber
            }
        }
        
    }

    func incrementCounter() {
        count += 1
    }

    func saveCounterData() {
        let currentDate = Date()
        let counterData = CounterData(count: count, date: currentDate)
        counterDataList.append(counterData)
        count = 0 // Resetta il contatore dopo aver salvato i dati
        showCounterLabel = true
    }

    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy HH:mm"
        return dateFormatter.string(from: date)
    }
    private func makePhoneCall() {
        guard let phoneURL = URL(string: "tel://\(phoneNumber)") else {
            // Gestisci l'URL non valido
            return
        }
        WKExtension.shared().openSystemURL(phoneURL)
    }
}

//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView()
//    }
//}
