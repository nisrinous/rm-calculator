//
//  History.swift
//  Calculator
//
//  Created by Renaldi Antonio on 12/07/24.
//

import Foundation
import SwiftData

@Model
class History: Identifiable {
    var id: UUID
    var date: Date
    var weight: Double
    var repetitions: Int
    var oneRepMax: Double
    
    init(date: Date, weight: Double, repetitions: Int, oneRepMax: Double) {
        self.id = UUID()
        self.date = date
        self.weight = weight
        self.repetitions = repetitions
        self.oneRepMax = oneRepMax
    }
}
