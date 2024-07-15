//
//  CustomNumberPad.swift
//  Calculator
//
//  Created by Retno Shintya Hariyani on 14/07/24.
//

import SwiftUI

struct CustomNumberPad: View {
    @Binding var activeTextField: Int?  // Untuk melacak text field mana yang aktif
    @Binding var textFields: [String] // Binding untuk menyimpan teks dari kedua field
    
    let rows = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [-2, 0, -1] // -1 represents the delete button, -2 represents the decimal point
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { number in
                        NumberButton(number: number, action: {
                            if number == -1 {
                                // Handle delete action if needed
                                if let activeIndex = activeTextField {
                                    if !textFields[activeIndex].isEmpty {
                                        textFields[activeIndex].removeLast()
                                    }
                                }
                            } else if number == -2 {
                                // Handle decimal point action if needed
                                if let activeIndex = activeTextField {
                                    if !textFields[activeIndex].contains(".") {
                                        textFields[activeIndex].append(".")
                                    }
                                }
                            } else {
                                // Append number to the active text field
                                if let activeIndex = activeTextField {
                                    textFields[activeIndex].append(String(number))
                                }
                            }
                        })
                    }
                }
            }
        }
        .padding(.bottom, 15)
    }
}

struct NumberButton: View {
    let number: Int
    let action: () -> Void  // Action to perform when button is tapped
    
    var body: some View {
        Button(action: {
            action()  // Perform action when button is tapped
        }) {
            if number == -1 {
                Image(systemName: "delete.left")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
            } else if number == -2 {
                Text(".")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
            } else {
                Text("\(number)")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primary)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
            }
        }
    }
}



