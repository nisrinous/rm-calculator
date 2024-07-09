//
//  TrainingWeightView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct TrainingWeightView: View {
    @StateObject private var viewModel = TrainingWeightViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Input One-Rep Max (1RM)")) {
                        TextField("1RM (kg)", text: $viewModel.oneRepMax)
                            .keyboardType(.decimalPad)
                    }
                    
                    Button(action: viewModel.calculateTrainingWeights) {
                        Text("Calculate Training Weights")
                    }
                    
                    if !viewModel.trainingWeights.isEmpty {
                        List(viewModel.trainingWeights.indices, id: \.self) { index in
                            Text("\(viewModel.percentages[index], specifier: "%.0f")%: \(viewModel.trainingWeights[index], specifier: "%.2f") kg")
                        }
                    }
                }
                .navigationTitle("Training Weight Calculator")
            }
        }
    }
}

#Preview {
    TrainingWeightView()
}
