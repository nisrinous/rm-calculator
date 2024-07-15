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
    @State private var isShowingDetail = false
    
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
                ChartOneRM(viewModel: viewModel) // Pass viewModel to ChartOneRM
                
                Button(action: {
                    isShowingDetail = true
                }) {
                    Text("Warm-Up")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .background(viewModel.weight.isEmpty || viewModel.repetitions.isEmpty ? Color.gray : Color(red: 1, green: 0.58, blue: 0))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        
                }
                .disabled(viewModel.weight.isEmpty || viewModel.repetitions.isEmpty)
                .sheet(isPresented: $isShowingDetail) {
                    WarmUpSheet(viewModel2: viewModel)
                        .background(Color(red: 0.89, green: 0.89, blue: 0.9))
                        .presentationDetents([.fraction(0.5), .medium, .large])
                }
                .padding(.bottom, 8)
                
                
                Spacer()
                
            }
            .navigationTitle("1RM Calculator")
            .onAppear {
                print("Current weight: \(viewModel.weight)")
            }
        }
    }
}


#Preview {
    OneRepMaxView()
}
