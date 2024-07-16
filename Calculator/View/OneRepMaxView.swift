//
//  OneRepMaxView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct OneRepMaxView: View {
    @StateObject private var viewModel = OneRepMaxViewModel()
    @ObservedObject var calculatorViewModel = CalculatorViewModel()

    @Environment(\.modelContext) var modelContext
    @State var selectedTraining = trainings[0]
    @State var activeInputIndex = 0
    
    @State private var isPresentingAlert = false

    
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
                .padding(.horizontal, 5)
                
                ChartOneRM(viewModel: viewModel, calculatorViewModel: calculatorViewModel, activeInputIndex: $activeInputIndex)
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.saveCalculation(modelContext: modelContext, trainingType: selectedTraining)
                        isPresentingAlert = true
                    }, label: {
                        Text("Save")
                    })
                    .disabled(
                        viewModel.weight.isEmpty || viewModel.repetitions.isEmpty
                    )
                    .alert("Saved!", isPresented: $isPresentingAlert) {
                        Button ("Got it!", role: .cancel) { }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("1RM Calculator")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .onAppear {
                print("Current weight: \(viewModel.weight)")
            }
        }
    }
}


#Preview {
    OneRepMaxView()
}
