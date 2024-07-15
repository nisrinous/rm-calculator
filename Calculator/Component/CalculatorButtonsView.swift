//
//  CalculatorButtonsView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct CalculatorButtonsView: View {
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    @State var activeInputIndex: Int
    
    var body: some View {
        VStack {
            VStack {
                ForEach(calculatorViewModel.buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            CalculatorButton(title: button) {
                                calculatorViewModel.buttonTapped(button, for: activeInputIndex)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

//
//#Preview {
//    CalculatorButtonsView(calculatorViewModel: CalculatorViewModel(), activeInputIndex: 0)
//}
