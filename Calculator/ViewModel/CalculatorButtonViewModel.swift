//
//  CalculatorButtonViewModel.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var displays: [String] = ["", ""]
    
    let buttons = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [",", "0", "x"]
    ]
    
    func buttonTapped(_ button: String, for index: Int) {
        guard displays.indices.contains(index) else { return }
        
        if button == "x" {
            displays[index] = delete(expression: displays[index])
        } else if button == "." {
            if !displays[index].contains(".") {
                displays[index] += button
            }
        } else {
            if displays[index] == "0" {
                displays[index] = button
            } else {
                displays[index] += button
            }
        }
    }
    
    private func delete(expression: String) -> String {
        return expression.isEmpty ? "" : String(expression.dropLast())
    }
}

