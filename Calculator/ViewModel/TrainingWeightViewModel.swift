//
//  TrainingWeightViewModel.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI
import Combine
import SwiftData

class TrainingWeightViewModel: ObservableObject {
    @Published var oneRepMax: String = ""
    @Published var percentages: [Double] = [50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]
    @Published var repetition: [Double] = [1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 30]
    @Published var trainingWeights: [Double] = []
    @Environment(\.modelContext) private var modelContext

    func calculateTrainingWeights() {
        guard let oneRepMax = Double(oneRepMax) else {
            return
        }
        trainingWeights = percentages.map { oneRepMax * ($0 / 100) }
    }

    func saveCalculation() {
        guard let oneRepMax = Double(oneRepMax), !trainingWeights.isEmpty else {
            return
        }

//        let newItem = Item(timestamp: Date(), calculationType: "TrainingWeight", oneRepMax: oneRepMax, percentages: percentages, trainingWeights: trainingWeights)
//        modelContext.insert(newItem)
    }
}
