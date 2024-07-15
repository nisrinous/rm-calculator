//
//  Item.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import Foundation
import SwiftData

@Model
class Item: Identifiable {
    var id: UUID
    var timestamp: Date
    var calculationType: String // "1RM" or "TrainingWeight"
    var weight: Double
    var repetitions: Double
    var oneRepMax: Double
    var percentage: Double
    var percentages: [Double]?
    var trainingWeights: [Double]?
    
    init(timestamp: Date, 
         calculationType: String,
         weight: Double,
         repetitions: Double,
         oneRepMax: Double,
         percentage: Double,
         percentages: [Double]? = nil,
         trainingWeights: [Double]? = nil) {
        self.id = UUID()
        self.timestamp = timestamp
        self.calculationType = calculationType
        self.weight = weight
        self.repetitions = repetitions
        self.oneRepMax = oneRepMax
        self.percentage = percentage
        self.percentages = percentages
        self.trainingWeights = trainingWeights
    }
}
