//
//  OneRepMaxView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct OneRepMaxView: View {
    @StateObject private var viewModel = OneRepMaxViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Weight")) {
                        TextField("Weight (kg)", text: $viewModel.weight)
                            .keyboardType(.decimalPad)
                    }
                    Section(header: Text("Repetitions")) {
                        TextField("Repetitions", text: $viewModel.repetitions)
                            .keyboardType(.numberPad)
                    }
                    Button(action: viewModel.calculateOneRepMax) {
                        Text("Calculate 1RM")
                    }
                    
                    if let oneRepMax = viewModel.oneRepMax {
                        Section(header: Text("Result")) {
                            Text("Estimated 1RM: \(oneRepMax, specifier: "%.2f") kg")
                            if let percentage = viewModel.percentage {
                                Text("Estimated percentage: \(percentage, specifier: "%.2f") %")
                            }
                        }
                    }
                }
                .navigationTitle("1RM Calculator")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button(action: {
//                            viewModel.saveCalculation()
//                        }, label: {
//                            Text("Save")
//                        })
//                    }
//                }
            }
        }
    }
}

#Preview {
    OneRepMaxView()
}
