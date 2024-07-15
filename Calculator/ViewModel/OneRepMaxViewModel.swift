//
//  OneRepMaxViewModel.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI
import Combine
import SwiftData

class OneRepMaxViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var repetitions: String = ""
    @Published var oneRepMax: Double?
    @Published var percentage: Double?
//    @Environment(\.modelContext) private var modelContext


    func calculateOneRepMax() {
        guard let weight = Double(weight), let repetitions = Double(repetitions), weight > 0, repetitions > 0 else {
            oneRepMax = 0.0
            return
        }
        oneRepMax = weight * (1 + (repetitions / 30))
        calculatePercentages()
    }
    
    func calculatePercentages() -> Int {
        guard let weight = Double(weight), let oneRepMax = oneRepMax else {
            return 0
        }
        
        if(oneRepMax != 0.0){
            return Int((weight / oneRepMax) * 100)
        }
        
       return 0
    }

    func saveCalculation(modelContext: ModelContext, trainingType: String) {
//        guard let weight = Double(weight), let repetitions = Double(repetitions), let oneRepMax = oneRepMax else {
//            return
//        }

//        let newItem = Item(timestamp: Date(), calculationType: "1RM", weight: weight, repetitions: repetitions, oneRepMax: oneRepMax, percentage: percentage ?? 0)
        let newHistory = History(date: Date(), weight: Double(weight)!, repetitions: Int(repetitions)!, oneRepMax: oneRepMax!, trainingType: trainingType)
        modelContext.insert(newHistory)
    }
}
