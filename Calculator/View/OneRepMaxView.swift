//
//  OneRepMaxView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct OneRepMaxView: View {
    @StateObject private var viewModel = OneRepMaxViewModel()
    @Environment(\.modelContext) var modelContext
    @State var selectedTraining = trainings[0]
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                HStack(){
                    Picker("training", selection: $selectedTraining) {
                        ForEach(trainings, id: \.self){ training in
                            Text(training)
                                .tag(training)
                        }
                    }
                    .tint(.primaryOrange)
                    Spacer()
                }
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
                    
                    /// BUAT DEBUG
//                    Button {
//                        do {
//                            try modelContext.delete(model: History.self)
//                        } catch {
//                            print("Failed to delete all schools.")
//                        }
//                    } label: {
//                        Text("Hapus data")
//                    }

                    /// ----------
                    
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
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.saveCalculation(modelContext: modelContext, trainingType: selectedTraining)
                        }, label: {
                            Text("Save")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    OneRepMaxView()
}
