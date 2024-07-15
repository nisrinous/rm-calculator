//
//  WarmUpCardViewModel.swift
//  Calculator
//
//  Created by Retno Shintya Hariyani on 14/07/24.
//

import Foundation

class WarmUpSheetViewModel: ObservableObject {
    func calculateWeightSuggestions(oneRepMax: Double, percentage: Double) -> String {
        let suggestion = oneRepMax * (percentage / 100)
        return String(format: "%.1f", suggestion)
    }
}
