//
//  TotalBody.swift
//  B&B
//
//  Created by Mario Esposito on 16/03/24.
//

import Foundation
import SwiftUI

//sezione esercizi Total body

struct TB1: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "TB1"
    
    var body: some View{
        ScrollView{
            VStack{
                Text("Circuit 1")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "TB1", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1.Position yourself face down with your arms bent and your feet resting on the ground.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Move one hand to the center of the mat, rotating in the opposite direction and placing the other hand on the ear.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Place one leg on the ground and one extended.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Bend the extended leg towards the elbow and return to the initial position.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Draw the hip towards parallel with the other, lifting it and lowering it in line with the mat.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Extend the leg upward again, then bend it and perform a push-up.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("7. Return to the starting position, performing the exercise on the other side.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("8. Slightly separate the knees.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("9. Point our feet on the mat.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("10. Apply a downward-facing dog style pose.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("11. Perform running, bending the legs one at a time to loosen the muscles.")
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

struct TB2: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "TB2"
    var body: some View{
        ScrollView{
            VStack{
                Text("Circuit 2")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "TB2", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Extend your body, with feet parallel to the mat but not too close to the glutes, and hands on the nape to support the head.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Lift one leg, while keeping it still, extend the other leg in a line at a 45-degree angle in front of you, and bring the head to the chest.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text(" 3. Fold both legs and pull them towards the chest, releasing the position of our lumbar area.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Extend your body, with feet parallel to the mat but not too close to the glutes, and hands on the nape to support the head.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text(" 5. Lift one leg keep it still and extend the other one, bringing the head to the chest.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Fold both legs and pull them towards the chest, releasing the position of our lumbar area.")
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



struct TB3: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "TB3"
    var body: some View{
        ScrollView{
            VStack{
                Text("Circuit 3")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "TB3", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Lie on your back with your knees bent and feet flat on the ground, hip-width apart.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Cross your hands behind your head, with elbows open to the sides.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("3. Exhale as you slowly lift your head and neck off the mat, bringing your chin towards your chest and keeping the lower back pressed into the floor.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("4. Inhale as you extend your legs along the floor, keeping your feet lifted about 45 degrees from the ground.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("5. Exhale as you lift your torso off the mat, bringing your chest towards your knees and extending your arms forward parallel to the floor")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("6. Hold the position for a deep breath, then slowly begin to return to the starting position, exhaling as you lower your torso and head, and inhaling as you bend your knees and bring your feet back to the ground.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("7. Extend your body, with feet parallel to the mat and arms by your sides.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("8. Inhale and, as you lift the lower body, bring your arms overhead, possibly resting them on the mat.")
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Text("9. Exhale and bring the arms back down to the starting position.")
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




struct TB4: View{
    @EnvironmentObject var eserciziManager: EserciziManager
    let idEsercizio = "TB4"
    var body: some View{
        ScrollView{
            VStack{
                Text("Circuit 4")
                    .font(.largeTitle)
                    .padding(.top, 25)
                VideoPlayerView(videoName: "TB4", videoType: "mov")
                    .frame(height: 300)
                    .frame(width: 350, height: 197)
                    .cornerRadius(20)
                    .padding()
                
                Text("1. Alternately lower the arms while lowering the center of gravity of your body in an upright position, as in the normal practice of a squat.")
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                
                Text("2. Rotate the arms and straighten the back to settle the body into its natural upright position.")
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


