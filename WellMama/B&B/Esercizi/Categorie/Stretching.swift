//
//  Stretching.swift
//  B&B
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import SwiftUI

//sezione esercizi stretching

struct stretching1: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "stretching1"
    var body: some View{
        ScrollView{
            VStack{
                Text("Figure-Four Stretch")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "strc1", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your back with your knees bent and feet on the floor.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Cross one ankle over the opposite knee, forming a 'four' shape with your legs.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Reach behind the thigh of the free leg and gently pull the leg towards your chest.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Hold the position for 15-30 seconds.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Switch sides and repeat with the other leg.")
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
        }    }
}



struct stretching2: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "stretching2"
    var body: some View{
        ScrollView{
            VStack{
                Text("Reverse Core Bicycle")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "strc2", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your back with your arms along your sides and hands resting on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Raise your legs off the floor, bending them slightly.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Alternate the movement by bringing one knee toward your chest while extending the other leg forward.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Continue pedaling backward in this manner, keeping your shoulders slightly lifted off the floor.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Repeat for the desired number of repetitions or for a certain period of time.")
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



struct stretching3: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "stretching3"
    var body: some View{
        ScrollView{
            VStack{
                Text("Kneeling Quad Stretch")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "strc3", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself on the floor on a mat or a soft surface with knees and hands on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Place one knee on the ground and bend the other knee forward, so that the foot is flat on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Keep your back straight and your torso lifted.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. With one hand, grab the foot of the bent leg, bringing the heel towards the glute.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Breathe deeply and try to relax the muscles while holding the position.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Switch sides and repeat with the other leg.")
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



struct stretching4: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "stretching4"
    var body: some View{
        ScrollView{
            VStack{
                Text("Hip Rotations")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "strc4", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Stand with your feet shoulder-width apart and your arms relaxed at your sides.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Slightly engage your abdominal muscles and maintain a straight back.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Begin to rotate your hips gently clockwise, making wide circles with your pelvis.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Keep your legs still during the movement and focus the action on the muscles of the hips.")
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



struct stretching5: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "stretching5"
    var body: some View{
        ScrollView{
            VStack{
                Text("Knee to Chest to Spinal Twist")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "strc5", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your back, and bring one knee to your chest.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. From the knee-to-chest position, rotate the knee towards the opposite side of your body.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Hold the twisted position for a few seconds.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Return to the starting position and repeat with the other leg.")
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



struct stretching6: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "stretching6"
    var body: some View{
        ScrollView{
            VStack{
                Text("Cat-Cow Stretch")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "strc6", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Get on all fours on the floor, with your hands under your shoulders and your knees under your hips.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Inhale, lower your belly towards the floor, lift your chin, and look upwards (the 'Cow' position).")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Exhale, curve your back upwards, tucking your chin towards your chest (the 'Cat' position).")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Alternate between these two positions, moving with your breath.")
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
