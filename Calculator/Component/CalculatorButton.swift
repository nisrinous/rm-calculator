//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct CalculatorButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(40)
                .padding(5)
        }
    }
}
