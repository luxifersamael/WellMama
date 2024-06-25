//
//  Yoga.swift
//  B&B
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import SwiftUI

//sezione esercizi yoga

struct yoga1: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "yoga1"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "yoga1", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie down on one side on the mat or a soft surface with one leg forward and the other on the ground, with the ankle of the latter flexed.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Join your hands and raise them above your head, widening your elbows, arching your back.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Turning your torso in the direction of the leg you have forward, bring the elbow of the opposite arm to the forward leg on top of it, maintaining the position.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Return to the initial position, then, making a circular motion with your arms, bring your hands to the sides of the forward foot and bring your chest closer to the leg.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Keeping your hands on the ground, swing the leg after straightening it, perform a bend on the arms, and bring the hips closer to the floor, arching the back backward.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Raise the hips upward, extend your arms, and raise the leg in line with the mat, up to the arms.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("7. Bring the leg back to the mat, returning to the initial position.")
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



struct yoga2: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "yoga2"
    var body: some View{
        ScrollView{
            VStack{
                Text("")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "yoga2", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Place one leg forward and extend the other leg on the ground, with the ankle of the latter flexed and place your hands on either side of the forward leg.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Shift your hips backward, extend the forward leg, and, keeping it straight with your hands on the floor, lower your head to the level of the leg.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Perform the opposite movement, pushing your hips forward and bringing your arms above your head.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. With a circular motion of the arms, bring them back to the sides of the foot and repeat the exercise.")
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



struct yoga3: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "yoga3"
    var body: some View{
        ScrollView{
            VStack{
                Text("Single leg pushup with knee and leg support")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "yoga3", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Position yourself face down on the floor with your hands slightly wider than shoulder-width apart and knees on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Lift one leg upwards, and bend your elbows and lower your body towards the floor.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Push through your hands to extend your arms and return to the starting position.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Switch legs and repeat the movement. Make sure to keep your back straight and perform the movement in a controlled manner.")
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


struct yoga4: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "yoga4"
    var body: some View{
        ScrollView{
            VStack{
                Text("Side Plank with Arm and Leg Raise")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "yoga4", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your side, with the elbow under the shoulder and the body in a straight line.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Lift the hips off the floor, keeping the body aligned.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Slowly raise the upper arm and leg off the floor.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Hold the position for a few seconds.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Slowly lower the arm and leg to the ground and switch sides.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Make sure to keep the body stable and controlled during the exercise.")
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



struct yoga5: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "yoga5"
    var body: some View{
        ScrollView{
            VStack{
                Text("Side-Lying Leg Raise")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "yoga5", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your side with the elbow bent and resting on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Slowly and slightly raise the upper leg upwards.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Lower the leg gently.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Complete the desired number of repetitions and switch sides.")
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



struct yoga6: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "yoga6"
    var body: some View{
        ScrollView{
            VStack{
                Text("Bridge")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "yoga6", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your back with your knees bent and feet flat on the floor.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Slowly raise your hips upwards, keeping your body in a straight line from head to knees.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Hold the position for a few seconds")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Lower your hips slowly towards the floor.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Repeat the movement for the desired number of times.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Ensure to maintain regular breathing and avoid lifting the hips too high.")
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
