//
//  funzioniEsercizizi.swift
//  B&B
//
//  Created by Mario Esposito on 15/03/24.
//

import Foundation
import SwiftUI

let videoWeekMappings: [String: Range<Int>] = [
    "yoga1": 0..<17, "yoga2": 0..<27, "yoga3": 0..<27, "yoga4": 17..<37, "yoga5": 27..<41, "yoga6": 27..<41,// etc...
    "pilates1": 0..<17, "pilates2": 0..<27, "pilates3": 0..<27,"pilates4": 17..<37,"pilates5": 27..<37, "pilates6": 27..<37,
    "strc1": 0..<17, "strc2": 0..<17, "strc3": 0..<27, "strc4": 17..<27, "strc5": 27..<37, "strc6": 27..<37,
    "TB1": 0..<17, "TB2": 0..<17, "TB3": 17..<27, "TB4": 17..<27,
    "pelvico1":27..<37,"pelvico2":27..<37,"pelvico3":27..<37,"pelvico4":37..<41,"pelvico5":37..<41,"pelvico6":37..<41
    
    
    // etc...
    // Aggiungi le altre mappature qui
]

func recommendedExercisesForWeek() -> [RecommendedExercise] {
    let currentWeek = defaults.integer(forKey: "CurrentWeek")
    let feeling1 = UserDefaults.standard.string(forKey: "userFeeling")
    let feeling2 = UserDefaults.standard.string(forKey: "userFeeling2")
    var health = HealthKitViewModel()
    health.fetchHealthData()
    let sleepHours = health.healthData.sleep
    let stepsCount = health.healthData.steps
    let recommendations: [(feeling: String, feeling2: String, sleepCondition: (Double) -> Bool, stepsCondition: (Int) -> Bool, exercises: [RecommendedExercise])] = [
        // 😁 - 😩 & 7h> & 5K> steps = Y-Pi-Pe
        ("Happy 😁", "Tired 😩", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        // 😁 - 😩 & 7h< & 5K> steps = Y-Pi
        ("Happy 😁", "Tired 😩", { $0 < 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        
        // 😁 - 😩 & 7h> & 5K< steps = Y-Pi-S-Pe
        ("Happy 😁", "Tired 😩", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"])]),
        
        // 😁 - 😩 & 7h< & 5K< steps = Y-Pe-S
        ("Happy 😁", "Tired 😩", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        // 😁 - 💪 & 7h> & 5K> steps = T-S-Pi-Pe-Y
        ("Happy 😁", "Full of energy 💪", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
//            😁 - 💪 & 7h< & 5K> steps = T-Y-S-Pe
        ("Happy 😁", "Full of energy 💪", { $0 < 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        
        // 😁 - 💪 & 7h> & 5K< steps = T-S-Pi-Pe
        ("Happy 😁", "Full of energy 💪", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        //😁 - 💪 & 7h< & 5K< steps = S-Pi-Pe-Y
        ("Happy 😁", "Full of energy 💪", { $0 < 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        //😁 - 😖 & 7h> & 5K> steps = Y-Pi-S
        
        ("Happy 😁", "Sore 😖", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        
        //😁 - 😖 & 7h< & 5K> steps = Y-S
        ("Happy 😁", "Sore 😖", { $0 < 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"])]),
        
        //😁 - 😖 & 7h> & 5K< steps = Y-Pi-S-Pe
        ("Happy 😁", "Sore 😖", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        
        // 😁 - 😖 & 7h< & 5K< steps = Y-Pi-S
        ("Happy 😁", "Sore 😖", { $0 < 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        
        
        // 😔 - 😩 & 7h> & 5K> steps = Y
        ("Sad 😔", "Tired 😩", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"])]),
        
        // 😔 - 😩 & 7h< & 5K> steps = None
        ("Sad 😔", "Tired 😩", { $0 < 7 }, { $0 > 5000 }, []),
        
        // 😔 - 😩 & 7h> & 5K< steps = Y-S-Pi
        ("Sad 😔", "Tired 😩", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        
        //😔 - 😩 & 7h< & 5K< steps = None
        ("Sad 😔", "Tired 😩", { $0 < 7 }, { $0 < 5000 }, []),
        
        //😔 - 💪 & 7h> & 5K> steps = Y-S-Pe
        ("Sad 😔", "Full of energy 💪", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        //😔 - 💪 & 7h< & 5K> steps = Y-S
        ("Sad 😔", "Full of energy 💪", { $0 < 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"])]),
        
        //😔 - 💪 & 7h> & 5K< steps = Y-Pi-Pe-S
        ("Sad 😔", "Full of energy 💪", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        
        //😔 - 💪 & 7h< & 5K< steps = Y-S
        ("Sad 😔", "Full of energy 💪", { $0 < 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"])]),
        
        //😔 - 😖 & 7h> & 5K> steps = None
        ("Sad 😔", "Sore 😖", { $0 > 7 }, { $0 > 5000 }, []),
        //😔 - 😩 & 7h> & 5K< steps = None
        ("Sad 😔", "Sore 😖", { $0 > 7 }, { $0 < 5000 }, []),
        //😔 - 😩 & 5h< & 5K> steps = None
        ("Sad 😔", "Sore 😖", { $0 < 7 }, { $0 > 5000 }, []),
        //😔 - 😩 & 5h< & 5K< steps = Y-Pe-S
        ("Sad 😔", "Sore 😖", { $0 < 7 }, { $0 < 5000 }, []),
        
        
        //😡 - 😩 & 7h> & 5K> steps = Y-Pe
        ("Angry 😡", "Tired 😩", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        //😡 - 😩 & 7h> & 5K< steps = Y-Pe-S
        ("Angry 😡", "Tired 😩", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        //😡 - 😩 & 7h< & 5K> steps = None
        ("Angry 😡", "Tired 😩", { $0 < 7 }, { $0 > 5000 }, []),
        //😡 - 😩 & 7h> & 5K< steps = Y-Pe-S
        ("Angry 😡", "Tired 😩", { $0 < 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        //😡 - 💪 & 7h> & 5K> steps = Y-Pe-Pi
        ("Angry 😡", "Full of energy 💪", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        //😡 - 💪 & 7h> & 5K< steps = Y-S-Pi-T
        ("Angry 😡", "Full of energy 💪", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]),RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"])]),
        //😡 - 💪 & 7h< & 5K> steps = Y-Pe-Pi
        ("Angry 😡", "Full of energy 💪", { $0 < 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"]), RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"])]),
        //😡 - 💪 & 7h< & 5K< steps = Y-S-Pe-T
        ("Angry 😡", "Full of energy 💪", { $0 < 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"]),RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"])]),
        //angry none
        ("Angry 😡", "Sore 😖", { $0 > 7 }, { $0 > 5000 }, []),
        ("Angry 😡", "Sore 😖", { $0 > 7 }, { $0 < 5000 }, []),
        ("Angry 😡", "Sore 😖", { $0 < 7 }, { $0 > 5000 }, []),
        ("Angry 😡", "Sore 😖", { $0 < 7 }, { $0 < 5000 }, []),
        
        // Caso di raccomandare tutto
        ("", "", { _ in true }, { _ in true }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        
        ("", "", { $0 < 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        ("", "", { $0 < 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        ("", "", { $0 > 7 }, { $0 > 5000 }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])]),
        ("", "", { $0 > 7 }, { $0 < 5000 }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])])
    ]
    
    let matchedRecommendations = recommendations.first { recommendation in
           recommendation.feeling == feeling1 && recommendation.feeling2 == feeling2 &&
           recommendation.sleepCondition(sleepHours) && recommendation.stepsCondition(stepsCount)
       }?.exercises ?? []
       
       if matchedRecommendations.isEmpty {
              return [RecommendedExercise(category: "Prenditi una pausa", videos: ["Nessun esercizio per te oggi"])]
       }

       // Filtra i video basati sulla settimana corrente
       let filteredExercises = matchedRecommendations.map { exercise -> RecommendedExercise in
           let filteredVideos = exercise.videos.filter { videoName in
               if let weekRange = videoWeekMappings[videoName] {
                   return weekRange.contains(currentWeek)
               }
               return false // Se il video non è nel dizionario, non viene incluso
           }
           return RecommendedExercise(category: exercise.category, videos: filteredVideos)
       }.filter { !$0.videos.isEmpty } // Rimuove le categorie senza video consigliati per la settimana corrente

       return filteredExercises
    

}

func destinationViewForExercise(videoName: String) -> some View {
    switch videoName {
    case "yoga1":
        return AnyView(yoga1())
    case "yoga2":
        return AnyView(yoga2())
    case "yoga3":
        return AnyView(yoga3())
    case "yoga4":
        return AnyView(yoga4())
    case "yoga5":
        return AnyView(yoga5())
    case "yoga6":
        return AnyView(yoga6())
    case "pilates1":
        return AnyView(pilates1())
    case "pilates2":
        return AnyView(pilates2())
    case "pilates3":
        return AnyView(pilates3())
    case "pilates4":
        return AnyView(pilates4())
    case "pilates5":
        return AnyView(pilates5())
    case "pilates6":
        return AnyView(pilates6())
    case "strc1":
        return AnyView(stretching1())
    case "strc2":
        return AnyView(stretching2())
    case "strc3":
        return AnyView(stretching3())
    case "strc4":
        return AnyView(stretching4())
    case "strc5":
        return AnyView(stretching5())
    case "strc6":
        return AnyView(stretching6())
    case "TB1":
        return AnyView(TB1())
    case "TB2":
        return AnyView(TB2())
    case "TB3":
        return AnyView(TB3())
    case "TB4":
        return AnyView(TB4())
    case "pelvico1":
        return AnyView(pelvico1())
    case "pelvico2":
        return AnyView(pelvico2())
    case "pelvico3":
        return AnyView(pelvico3())
    case "pelvico4":
        return AnyView(pelvico4())
    case "pelvico5":
        return AnyView(pelvico5())
    case "pelvico6":
        return AnyView(pelvico6())
    default:
        return AnyView(Text("Esercizio non trovato"))
    }
}

struct RecommendedExercise: Hashable {
    let category: String
    let videos: [String]
}
