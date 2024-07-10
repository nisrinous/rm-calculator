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
    @Environment(\.modelContext) private var modelContext

    func calculateOneRepMax() {
        guard let weight = Double(weight), let repetitions = Double(repetitions) else {
            return
        }
        oneRepMax = weight * (1 + (repetitions / 30))
    }

    func saveCalculation() {
        guard let weight = Double(weight), let repetitions = Double(repetitions), let oneRepMax = oneRepMax else {
            return
        }

        let newItem = Item(timestamp: Date(), calculationType: "1RM", weight: weight, repetitions: repetitions, oneRepMax: oneRepMax)
        modelContext.insert(newItem)
    }
}
