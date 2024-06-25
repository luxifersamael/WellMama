//
//  Pelvici.swift
//  B&B
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import SwiftUI
//sezione esercizi pelvico

struct pelvico1: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pelvico1"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pelvico1", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself on the ground on a mat or soft surface with knees and hands on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Bend to one side, placing one leg on a mat and the other parallel to it.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Perform movements with the raised leg such as rotation, stretching, and closing.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Repeat the steps by positioning yourself on the other side and using the other leg.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    eserciziManager.completaEsercizio(id: idEsercizio)
                    DailyResetManager.shared.dailyCounter += 1
                }) {
                    Text(eserciziManager.esercizioCompletato(id: idEsercizio) ? "Good job!" : "Click here to complete the excercise")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(eserciziManager.esercizioCompletato(id: idEsercizio) ? Color.gray : Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .opacity(eserciziManager.esercizioCompletato(id: idEsercizio) ? 0.5 : 1)
                }
                .disabled(eserciziManager.esercizioCompletato(id: idEsercizio))
                .padding()
            }
        }

    }
}



struct pelvico2: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pelvico2"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pelvico2", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself on the ground on a mat or a soft surface with knees on the ground and hands bent.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Place one leg on the mat and the other parallel to it.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Perform movements with the raised leg such as rotation, stretching, and closing.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Repeat the steps by positioning yourself on the other side and using the other leg.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    eserciziManager.completaEsercizio(id: idEsercizio)
                    DailyResetManager.shared.dailyCounter += 1
                }) {
                    Text(eserciziManager.esercizioCompletato(id: idEsercizio) ? "Good job!" : "Click here to complete the excercise")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(eserciziManager.esercizioCompletato(id: idEsercizio) ? Color.gray : Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .opacity(eserciziManager.esercizioCompletato(id: idEsercizio) ? 0.5 : 1)
                }
                .disabled(eserciziManager.esercizioCompletato(id: idEsercizio))
                .padding()
            }
        }

    }
}



struct pelvico3: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pelvico3"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pelvico3", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself standing on a mat or a soft surface with hands on your hips.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Bend your knees into a squat and stretch to the side of your preference.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Repeat the steps by positioning yourself on the other side and using the other leg.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    eserciziManager.completaEsercizio(id: idEsercizio)
                    DailyResetManager.shared.dailyCounter += 1
                }) {
                    Text(eserciziManager.esercizioCompletato(id: idEsercizio) ? "Good job!" : "Click here to complete the excercise")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(eserciziManager.esercizioCompletato(id: idEsercizio) ? Color.gray : Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .opacity(eserciziManager.esercizioCompletato(id: idEsercizio) ? 0.5 : 1)
                }
                .disabled(eserciziManager.esercizioCompletato(id: idEsercizio))
                .padding()
            }
        }

    }
}


struct pelvico4: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pelvico4"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pelvico4", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself kneeling on a mat or a soft surface, with one leg bent at a 180° angle and the other extended.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Hands on hips, lift one leg toward the back of your head and place the bent leg at a 90° angle.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Repeat the steps by positioning yourself on the other side and using the other leg.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    eserciziManager.completaEsercizio(id: idEsercizio)
                    DailyResetManager.shared.dailyCounter += 1
                }) {
                    Text(eserciziManager.esercizioCompletato(id: idEsercizio) ? "Good job!" : "Click here to complete the excercise")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(eserciziManager.esercizioCompletato(id: idEsercizio) ? Color.gray : Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .opacity(eserciziManager.esercizioCompletato(id: idEsercizio) ? 0.5 : 1)
                }
                .disabled(eserciziManager.esercizioCompletato(id: idEsercizio))
                .padding()
            }
        }

    }
}


struct pelvico5: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pelvico5"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pelvico5", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Sretched out in front of you.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. While extending your arms, swing the leg, then straighten it and extend your arms to the front.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Now extend the leg you brought up and lean forward, reuniting your arms in front again.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    eserciziManager.completaEsercizio(id: idEsercizio)
                    DailyResetManager.shared.dailyCounter += 1
                }) {
                    Text(eserciziManager.esercizioCompletato(id: idEsercizio) ? "Good job!" : "Click here to complete the excercise")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(eserciziManager.esercizioCompletato(id: idEsercizio) ? Color.gray : Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .opacity(eserciziManager.esercizioCompletato(id: idEsercizio) ? 0.5 : 1)
                }
                .disabled(eserciziManager.esercizioCompletato(id: idEsercizio))
                .padding()
            }
        }
    }
}


struct pelvico6: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pelvico6"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pelvico6", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Stand up with your legs bent, positioning your feet at a width twice that of your shoulders and your toes and knees pointing outward.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Place your hands on your hips and push upward, contracting the glutes.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Bend your knees until they form a 90° angle, simulating a squat.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 40)
                
                Button(action: {
                    eserciziManager.completaEsercizio(id: idEsercizio)
                    DailyResetManager.shared.dailyCounter += 1
                }) {
                    Text(eserciziManager.esercizioCompletato(id: idEsercizio) ? "Good job!" : "Click here to complete the excercise")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(eserciziManager.esercizioCompletato(id: idEsercizio) ? Color.gray : Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .opacity(eserciziManager.esercizioCompletato(id: idEsercizio) ? 0.5 : 1)
                }
                .disabled(eserciziManager.esercizioCompletato(id: idEsercizio))
                .padding()
            }
        }
    }
}
