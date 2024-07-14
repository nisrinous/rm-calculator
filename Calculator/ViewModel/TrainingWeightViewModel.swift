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
    @Published var percentages: [Double] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
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
