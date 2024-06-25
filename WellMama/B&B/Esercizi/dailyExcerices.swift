//
//  dailyExcerices.swift
//  B&B
//
//  Created by Mario Esposito on 19/03/24.
//

import Foundation
import SwiftUI

class ExerciseRecommendationViewModel: ObservableObject {
    @Published var recommendedExercises: [RecommendedExercise] = []
    private var healthData: HealthData
    private var userFeeling: String?
    private var userFeeling2: String?

    init(healthData: HealthData, userFeeling: String?, userFeeling2: String?) {
        self.healthData = healthData
        self.userFeeling = userFeeling
        self.userFeeling2 = userFeeling2
        updateRecommendations()
    }

    private func updateRecommendations() {
        let sleepHours = healthData.sleep
        let stepsCount = healthData.steps

        // Mapping delle combinazioni di sentimenti e dati di HealthKit alle raccomandazioni di esercizi
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
            ("", "", { _ in true }, { _ in true }, [RecommendedExercise(category: "Pilates", videos: ["pilates1", "pilates2", "pilates3", "pilates4", "pilates5", "pilates6"]), RecommendedExercise(category: "Yoga", videos: ["yoga1", "yoga2", "yoga3", "yoga4", "yoga5", "yoga6"]), RecommendedExercise(category: "Total Body", videos: ["TB1", "TB2", "TB3", "TB4"]), RecommendedExercise(category: "Stretching", videos: ["strc1", "strc2", "strc3", "strc4", "strc5", "strc6"]), RecommendedExercise(category: "Pelvici", videos: ["pelvico1", "pelvico2", "pelvico3", "pelvico4", "pelvico5", "pelvico6"])])
        ]

        // Trova la prima raccomandazione che corrisponde ai sentimenti e ai dati di HealthKit
        if let match = recommendations.first(where: { $0.feeling == userFeeling && $0.feeling2 == userFeeling2 && $0.sleepCondition(sleepHours) && $0.stepsCondition(stepsCount) }) {
            if match.exercises.isEmpty {
                // Nessun esercizio consigliato
                recommendedExercises = [RecommendedExercise(category: "Prenditi una pausa", videos: ["Nessun esercizio per te oggi"])]
            } else {
                recommendedExercises = match.exercises
            }
        } else {
            // Nessun match trovato, si potrebbe considerare di fornire un messaggio di default o un insieme di esercizi generici
            recommendedExercises = [RecommendedExercise(category: "Prenditi una pausa", videos: ["Nessun esercizio per te oggi"])]
        }
    }
}


