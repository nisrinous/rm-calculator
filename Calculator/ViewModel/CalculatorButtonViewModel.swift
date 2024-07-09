//
//  CalculatorButtonViewModel.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    
    let buttons = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0", ".", "x"]
    ]
    
    func buttonTapped(_ button: String) {
        if button == "x" {
            display = delete(expression: display)
        } else if button == "." {
            if !display.contains(".") {
                display += button
            }
        } else {
            if display == "0" {
                display = button
            } else {
                display += button
            }
        }
    }
    
    private func delete(expression: String) -> String {
        
        return expression
    }
}
