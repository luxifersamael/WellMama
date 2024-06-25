import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var crownRotation = 0.0
    @StateObject var manager = WatchDailyResetManager()
    @State private var phoneNumber: String = "3392742557"
    @State private var currentWeek = 20
    @State private var emoji = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        //        NavigationView{
        TabView(selection: $selection) {
            
            VStack {
                ZStack {
                    VStack {
                        //la progressView si incrementa in base al numero di esercizi e avanza premendo done
                        Text("\(currentWeek)° Week")
                        
                            .font(.title3)
                            .bold()
                            .position(x:90,y:-10)
                        
                        ProgressView(value: Double(manager.dailyCounter), total: 4)
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(3.0)
                                
                            .overlay(content: {
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        Image(systemName: "cross.case")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    )
                                    .onLongPressGesture(minimumDuration: 0.0) {
                                        // Questa è la funzione che vuoi chiamare con un long press
                                        makePhoneCall()
                                    }
                                    .position(x:25, y:25)
                            })
                        
                        Spacer(minLength: 50)
                        
                    }
                    .onAppear {
                        // Assegna il numero di telefono dal manager al phoneNumber state
//                        phoneNumber = manager.phoneNumber
                        manager.requestCounterValue()
//                        currentWeek = manager.currentWeek
                        // Se il numero non è già disponibile, richiedilo
                        if phoneNumber.isEmpty {
                            manager.requestPhoneNumber()
                            phoneNumber = manager.phoneNumber
                        }
                    }
                }
                .tag(0)
            }//Fine prima schermata dello scroll
            
            VStack {
                //insieme di emoji a bottone che indirizzano la tipologia di notifiche della giornata
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
                    .position(x:20, y:-10)
                
                //aggiungere che ad ogni emoji vengono mandate le notifiche
                Text("How do you feel?")
                    .padding()
                VStack{
                    HStack{
                        Button(action: {
                            emoji = true
                        }, label: {
                            Text("😁")
                                .font(.system(size: 35))
                        })
                        .alert(isPresented: $emoji){
                            Alert( title: Text("So..."), message: Text("Are you happy today?"),
                                   primaryButton: .default(Text("no")) {
                            },
                                   secondaryButton: .default(Text("yes")) {
                            }
                            )
                        }
                        
                        Button(action: {
                            emoji = true
                        }, label: {
                            Text("😔")
                                .font(.system(size: 35))
                        })
                        .alert(isPresented: $emoji){
                            Alert( title: Text("So..."), message: Text("Are you sad today?"),
                                   primaryButton: .default(Text("no")) {
                            },
                                   secondaryButton: .default(Text("yes")) {
                            }
                            )
                        }
                    }
                    HStack{
                        Button(action: {
                            emoji = true
                        }, label: {
                            Text("☺️")
                                .font(.system(size: 35))
                        })
                        .alert(isPresented: $emoji){
                            Alert( title: Text("So..."), message: Text("Are you calm today?"),
                                   primaryButton: .default(Text("no")) {
                            },
                                   secondaryButton: .default(Text("yes")) {
                            }
                            )
                        }
                        
                        Button(action: {
                            emoji = true
                        }, label: {
                            Text("😡")
                                .font(.system(size: 35))
                        })
                        .alert(isPresented: $emoji){
                            Alert( title: Text("So..."), message: Text("Are you angry today?"),
                                   primaryButton: .default(Text("no")) {
                            },
                                   secondaryButton: .default(Text("yes")) {
                            }
                            )
                        }
                    }
                }//Fine vstack delle coppie di bottoni
                
                Spacer(minLength: 10)
                
                
            }//Fine seconda schermata dello scroll
            .tag(1)
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
                    .position(x:20, y:-10)
                ExerciseCounterView(manager:manager)
                    .position(x:100,y:0)
            }
            .tag(2)
            .tabItem {
                Label("Third", systemImage: "3.circle")
            }
            NavigationView {
                            
                CounterView(manager:manager)
                    
                //Fien quarta schermata dello scroll
                
                
            }
            .tag(3)
        }//Fine Tab View
        .tabViewStyle(.verticalPage)
        .onReceive(timer) { _ in
            let newIndex = (selection + Int(crownRotation)).clamped(to: 0...3)
            if newIndex != selection {
                selection = newIndex
            }
        }
        .focusable(true) { isFocused in
            if isFocused {
                /* Aggiungi qui il feedback della digital crown se necessario */
            }
        }
        .digitalCrownRotation($crownRotation, from: -1, through: 1, by: 0.1)
        //        }//Fine navigation View
        
        
        
        
    }
    private func makePhoneCall() {
        guard let phoneURL = URL(string: "tel://\(phoneNumber)") else {
            // Gestisci l'URL non valido
            return
        }
        WKExtension.shared().openSystemURL(phoneURL)
    }
}

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}


#Preview{
    ContentView()
}

