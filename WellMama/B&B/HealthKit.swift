//
//  HealthKit.swift
//  B&B
//
//  Created by MattiaJ03 on 12/02/24.
//

import Foundation
import HealthKit
import BackgroundTasks


struct HealthData {
    var sleep: Double // Ore di sonno
    var age: Int // Età
    var steps: Int // Numero di passi
}


class HealthKitViewModel: ObservableObject {
    private var healthStore = HKHealthStore()
    @Published var healthData = HealthData(sleep: 0, age: 0, steps: 0)
    init() {
        requestAuthorization()
    }

    func requestAuthorization() {
          let healthKitTypesToRead: Set<HKObjectType> = [
              HKObjectType.quantityType(forIdentifier: .stepCount)!,
              HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
              HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!
          ]
          
          healthStore.requestAuthorization(toShare: [], read: healthKitTypesToRead) { [weak self] success, error in
              if success {
                  self?.fetchHealthData()
              } else {
                  print("HealthKit authorization denied: \(String(describing: error?.localizedDescription))")
              }
          }
      }

    private func registerBackgroundTask() {
        let backgroundTaskIdentifier = "com.example.healthkit.backgroundTask"
        BGTaskScheduler.shared.register(forTaskWithIdentifier: backgroundTaskIdentifier, using: nil) { task in
            // Chiamare la funzione fetchHealthData() per recuperare i dati
            self.fetchHealthData()
            // Completa l'attività
            task.setTaskCompleted(success: true)
        }
        
        // Pianifica l'esecuzione dell'attività ogni ora
        let request = BGAppRefreshTaskRequest(identifier: backgroundTaskIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 60 * 60) // Ogni ora
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Impossibile pianificare l'attività di aggiornamento: \(error.localizedDescription)")
        }
    }

    
    func fetchHealthData() {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
            
// Verifica se è notte (ad esempio, dalle 22:00 alle 6:00)
        if hour >= 22 || hour < 6 {
            print("Non recuperare dati durante la notte")
            return
            }
        
        fetchAge()
        fetchSteps()
        fetchSleep()
    }
    
    private func fetchAge() {
        do {
            let birthdayComponents = try healthStore.dateOfBirthComponents()
            let today = Date()
            let calendar = Calendar.current
            let ageYears = calendar.dateComponents([.year], from: birthdayComponents.date!, to: today).year!
            DispatchQueue.main.async {
                self.healthData.age = ageYears
                
            }
        } catch {
            print("Error fetching age: \(error.localizedDescription)")
        }
    }
    


    private func fetchSteps() {
        guard let stepType = HKSampleType.quantityType(forIdentifier: .stepCount) else {
            print("Passi non supportati")
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                if let error = error {
                    print("Errore nel recuperare i passi: \(error.localizedDescription)")
                }
                return
            }
            
            let stepCount = Int(sum.doubleValue(for: HKUnit.count()))
            
            DispatchQueue.main.async {
                self.healthData.steps = stepCount
            }
        }
        
        healthStore.execute(query)
    }

    private func fetchSleep() {
        guard let sleepType = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis) else {
            print("Dati sul sonno non supportati")
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
            guard let samples = samples as? [HKCategorySample] else {
                if let error = error {
                    print("Errore nel recuperare i dati sul sonno: \(error.localizedDescription)")
                }
                return
            }
            
            let totalSleepTime = samples.reduce(0.0) { $0 + $1.endDate.timeIntervalSince($1.startDate) }
            
            DispatchQueue.main.async {
                // Convertire il tempo di sonno in ore
                self.healthData.sleep = totalSleepTime / 3600
            }
        }
        
        healthStore.execute(query)
    }

}







