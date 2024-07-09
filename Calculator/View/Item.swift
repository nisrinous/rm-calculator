//
//  Item.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import Foundation
import SwiftData

@Model
final class Item: Identifiable {
    var timestamp: Date
    var calculationType: String // "1RM" or "TrainingWeight"
    var weight: Double?
    var repetitions: Double?
    var oneRepMax: Double?
    var percentages: [Double]?
    var trainingWeights: [Double]?
    
    init(timestamp: Date, calculationType: String, weight: Double? = nil, repetitions: Double? = nil, oneRepMax: Double? = nil, percentages: [Double]? = nil, trainingWeights: [Double]? = nil) {
        self.timestamp = timestamp
        self.calculationType = calculationType
        self.weight = weight
        self.repetitions = repetitions
        self.oneRepMax = oneRepMax
        self.percentages = percentages
        self.trainingWeights = trainingWeights
    }
}
