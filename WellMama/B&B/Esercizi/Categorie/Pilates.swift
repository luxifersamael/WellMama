//
//  Pilates.swift
//  B&B
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import SwiftUI

//sezione esercizi pilates

struct pilates1: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pilates1"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pilates1", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself on the ground with your head lifted, hands on your head, and legs bent at the hips.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Straighten your legs, separating them when you have reached maximum extension.")
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



struct pilates2: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pilates2"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pilates2", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself on the ground face down, with your hands together and extended downward.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Roll onto one side, leaving the arm of that side bent on the mat, and the opposite leg bent toward the buttocks at a 90° angle.")
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



struct pilates3: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pilates3"
    var body: some View{
        ScrollView{
            VStack{
                Text("Side-to-Side Hip Shift")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pilates3", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Stand up straight with your feet slightly apart.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Place your hands on your hips or let them hang down by your sides.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Slowly shift your hips from right to left.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Focus on keeping your torso upright and your weight evenly distributed on your feet.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Repeat the movement back and forth for the desired number of times or for a certain period of time.")
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



struct pilates4: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pilates4"
    var body: some View{
        ScrollView{
            VStack{
                Text("Alternative Hip Circles")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pilates4", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Stand with your hands on your hips.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Move your hips forward and backward, keeping the movement limited to this direction.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Continue for the desired number of repetitions or for a certain period of time.")
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


struct pilates5: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pilates5"
    var body: some View{
        ScrollView{
            VStack{
                Text("Hip Circles")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pilates5", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Stand with your hands on your hips.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Make small circles with your hips, moving them forward, backward, and laterally.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Keep the movement fluid and controlled.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. You can perform the movement in both directions.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Repeat for the desired number of times.")
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



struct pilates6: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "pilates6"
    var body: some View{
        ScrollView{
            VStack{
                Text("Pregnancy Squat with Arm Raise")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "pilates6", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Stand with feet slightly wider than shoulder-width apart.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Perform a semi-squat by bending your knees slightly.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Raise your arms in front of your chest or overhead as you lower down.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Hold the position for a second.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Return to standing position as you lower your arms.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Repeat for the desired number of times.")
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
