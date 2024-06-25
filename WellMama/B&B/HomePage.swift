import SwiftUI

var eDOB = Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 14)) ?? Date()

// Struttura di dati per la cronologia delle risposte
struct AnswerHistoryItem: Identifiable {
    let id = UUID()
    let date: Date
    let howDoYouFeel: String
    let howAreYou: String
}

private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()


let fotoFeto = [
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35", "36","37", "38", "39", "40"
]


extension UserDefaults {
    func setEncodable<T: Encodable>(_ value: T?, forKey key: String) {
        let jsonData = try? JSONEncoder().encode(value)
        self.set(jsonData, forKey: key)
    }

    func getDecodable<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let jsonData = self.value(forKey: key) as? Data else { return nil }
        // La correzione avviene qui: passa i dati JSON al decoder correttamente
        return try? JSONDecoder().decode(type, from: jsonData)
    }
}


struct HouseView: View {
    @State private var selectedTab: String = "house"
    @ObservedObject var datiUtente: userData

    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                exercises(datiUtente: datiUtente)
                    .tag("magnifyingglass")
                    .tabItem {
                        Image(systemName: "figure.run")
                    }

                HouseDetailView(datiUtente: datiUtente)
                    .tag("house")
                    .tabItem {
                        Image(systemName: "person.2.fill")
                    }

                DiaryView()
                    .tag("gearshape")
                    .tabItem {
                        Image(systemName: "book.fill")
                    }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HouseDetailView: View {
    @ObservedObject var datiUtente: userData
    @State private var selectedTab: String = "house"
    @State private var showFeelingSheet: Bool = false
    @State private var showFeelingSheet2: Bool = false
    @State private var userFeeling: String? = UserDefaults.standard.string(forKey: "userFeeling")
    @State private var userFeeling2: String? = UserDefaults.standard.string(forKey: "userFeeling2")
    @State private var answerHistory: [AnswerHistoryItem] = []
    @StateObject private var health = HealthKitViewModel()
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
    }()
    
    let feelings = ["Happy 😁", "Sad 😔", "Angry 😡"]
    
    let feelings2 = ["Tired 😩", "Full of energy 💪", "Sore 😖"]
    
    // Integrate salutation logic here
    
    var body: some View {

        ScrollView(showsIndicators: false) {
            VStack {
                Spacer()
                Spacer(minLength: 30)
                HStack {
                    Text("Hi \(defaults.string(forKey: "Name") ?? "")")
                        .font(.system(size: 35, weight: .bold))
                        .position(CGPoint(x: 100, y: 10))
                    
                    
                    
                    NavigationLink(destination: settings(datiUtente: userData())){
                        Image(systemName: "gear")
                            .font(.system(size: 25))
                            .position(x:150,y:10)
                    }
                }
                Spacer(minLength: 30)
                
                Image("\(datiUtente.currentWeek + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 310)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .offset( x: 0, y: 0)
                
                Spacer(minLength: 30)
                Text("Your baby might be born:")
                                    Text("From: \(dateFormatter.string(from: datiUtente.lBound ?? Date()))")
                                    Text("To: \(dateFormatter.string(from: datiUtente.uBound ?? Date()))")
                                        .onAppear{
                                        datiUtente.calcolaLowerBound(dataParto: datiUtente.ultimaMestruazione)
                                            datiUtente.calcolaUpperBound(dataParto: datiUtente.ultimaMestruazione)
                                        }


                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.white, Color.pink.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                            )
                            .frame(width: 300, height: 170)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("\(UserDefaults.standard.integer(forKey: "CurrentWeek")) weeks pregnant")
                                        .font(.system(size: 25, weight: .bold))
                                        .padding()
                                    
                                    
                                    Text("\(datiUtente.calcolaTrimestre(currentWeek: datiUtente.currentWeek))° Trimester")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                    
                                    //                                        Text("E-DOB: \(eDOB)° Trimestre")
                                    //                                            .foregroundColor(.gray)
                                    //                                            .font(.system(size: 15))
                                    
                                    ProgressView(value: defaults.value(forKey: "CurrentWeek") as? CGFloat ?? 1, total: 40)
                                        .progressViewStyle(LinearProgressViewStyle(tint: .pink))
                                        .scaleEffect(x: 0.8, y: 3)
                                        .frame(height: 30)
                                    
                                }
                                    .padding()
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.white, Color.pink.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                            )
                            .frame(width: 300, height: 170)
                            .overlay(
                                Button(action: {
                                    // Mostra l'ActionSheet
                                    showFeelingSheet = true
                                }) {
                                    VStack(alignment: .leading) {
                                        Text("How do you feel?")
                                            .foregroundColor(Color.black)
                                        
                                            .font(.system(size: 25, weight: .bold))
                                        
                                        if let userFeeling = userFeeling {
                                            Text(userFeeling)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 15))
                                        } else {
                                            Text("Select your response")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 15))
                                        }
                                    }
                                }
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                            .actionSheet(isPresented: $showFeelingSheet) {
                                ActionSheet(title: Text("How do you feel?"), buttons: feelings.map { feeling in
                                    .default(Text(feeling)) {
                                        // Salva la risposta e la data attuale
                                        UserDefaults.standard.set(feeling, forKey: "userFeeling")
                                        UserDefaults.standard.set(Date(), forKey: "lastAnswerDate")
                                        userFeeling = feeling
                                        datiUtente.userFeeling = feeling
                                    }
                                } + [.cancel()])
                            }
                            // Aggiungi la logica simile per showFeelingSheet2 e altre parti della tua view dove necessario

                            .onAppear {
                                checkAndResetAnswersIfNeeded()
                            }
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.white, Color.pink.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                            )
                            .frame(width: 300, height: 170)
                            .overlay(
                                Button(action: {
                                    // Mostra l'ActionSheet
                                    showFeelingSheet2 = true
                                }) {
                                    VStack(alignment: .leading) {
                                        Text("How are you?")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 25, weight: .bold))
                                        
                                        if let userFeeling2 = userFeeling2 {
                                            Text(userFeeling2)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 15))
                                        } else {
                                            Text("Select your response")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 15))
                                        }
                                    }
                                }
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                            .actionSheet(isPresented: $showFeelingSheet2) {
                                ActionSheet(title: Text("How are you?"), buttons: feelings2.map { feeling2 in
                                    .default(Text(feeling2)) {
                                        // Salva la risposta e la data attuale
                                        UserDefaults.standard.set(feeling2, forKey: "userFeeling2")
                                        UserDefaults.standard.set(Date(), forKey: "lastAnswerDate2")
                                        userFeeling2 = feeling2
                                        datiUtente.userFeeling2 = feeling2
                                    }
                                } + [.cancel()])
                            }
                            // Aggiungi la logica simile per showFeelingSheet2 e altre parti della tua view dove necessario

                            .onAppear {
                                checkAndResetAnswersIfNeeded()
                            }
                        
                        
                    }
                    .onAppear {
                        incrementaSettimaneGravidanza()
                        health.fetchHealthData()
                        
                    }
                    .padding([.horizontal], 30)
                }
                
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 0)
            }
            .padding(.horizontal, 30)
        }
        .padding()
        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 0)
        .padding([.horizontal], -20)
    }
    private func checkAndResetAnswersIfNeeded() {
        let calendar = Calendar.current
        let lastAnswerDate = UserDefaults.standard.object(forKey: "lastAnswerDate") as? Date ?? Date()
        let lastAnswerDate2 = UserDefaults.standard.object(forKey: "lastAnswerDate2") as? Date ?? Date()
        if !calendar.isDateInToday(lastAnswerDate) {
            // La data dell'ultima risposta non è oggi, quindi resettiamo le risposte
            UserDefaults.standard.removeObject(forKey: "userFeeling")
            userFeeling = nil
        }
        if !calendar.isDateInToday(lastAnswerDate2) {
            // La data dell'ultima risposta non è oggi, quindi resettiamo le risposte
            UserDefaults.standard.removeObject(forKey: "userFeeling2")
            userFeeling2 = nil
        }
    }
    
}

struct AnswerHistoryView: View {
    @Binding var answerHistory: [AnswerHistoryItem]

    var body: some View {
        List(answerHistory, id: \.date) { item in
            VStack(alignment: .leading) {
                Text("Date: \(item.date)")
                Text("How do you feel: \(item.howDoYouFeel)")
                Text("How are you: \(item.howAreYou)")
            }
        }
        .navigationTitle("Cronologia Risposte")
    }
}

struct MagnifyingGlassView: View {
    var body: some View {
        Text("Magnifying Glass View")
    }
}

struct GearshapeView: View {
    var body: some View {
        Text("Gearshape View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView(datiUtente: userData())
    }
}
