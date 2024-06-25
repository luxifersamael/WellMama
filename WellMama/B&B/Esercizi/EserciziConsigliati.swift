import Foundation
import SwiftUI


//View dell'occorrente per gli esercizi
struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
    VStack {
        Button {
           dismiss()
        } label: {
            Image(systemName: "xmark.circle")
                .position(x:40,y:50)
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
            Text("Occorrente:\n- Tappetino;\n- Tuta;\n- Caricatore.")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
}

struct exercises: View{
    @StateObject var datiUtente: userData
    @State private var showSheet = false
    @State private var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect() // Timer che triggera ogni 5 secondi

    private var recommendedExercisesSection: some View {
        ForEach(recommendedExercisesForWeek(), id: \.self) { exercise in
            VStack {
                    Text(exercise.category)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(exercise.videos, id: \.self) { video in
                            NavigationLink(destination: destinationViewForExercise(videoName: video)) {
                                VideoPlayerView(videoName: video, videoType: "mov")
                                    .frame(width: 150, height: 84)
                                    .cornerRadius(20)
                                    .padding(.bottom)
                            }
                        }
                    }
                    .padding([.horizontal], 30)
                }
            }
        }
    }
    

    var body: some View{
        NavigationView{
            ScrollView(showsIndicators:false){
                Spacer(minLength: 50)
                
                recommendedExercisesSection
                
                
                Spacer(minLength: 30)
                    
                    
                    NavigationLink(destination: allex(datiUtente: userData())) {
                        Text("All Exercises")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.black)
                            .bold()
                            .background(Color(.pink.opacity(0.3)))
                            .cornerRadius(20)
                }
                
                
                    Spacer(minLength: 50)
                
            }//Fine scroll view veritcale
            .navigationBarTitle("Exercises week \(defaults.integer(forKey: "CurrentWeek"))", displayMode: .automatic)
  
        }
        
    }
    
}




#Preview{
    exercises(datiUtente: userData())
}
