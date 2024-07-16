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
        Button(action: {
            action()
        }) {
            if title == "x" {
                Image(systemName: "delete.left")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
            } else if title == "," {
                Text(",")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
            } else {
                Text("\(title)")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
            }
        }
    }
}
