//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct CalculatorButtons: View {
    @StateObject private var viewModel = CalculatorViewModel()

    var body: some View {
        VStack {
            Text(viewModel.display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .foregroundColor(.black)
            
            VStack {
                ForEach(viewModel.buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            CalculatorButton(title: button) {
                                viewModel.buttonTapped(button)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalculatorButtons()
}
