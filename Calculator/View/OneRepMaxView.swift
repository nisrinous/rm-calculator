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
    @State private var isShowingDetail = false
    @State var activeInputIndex = 0

    
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
                
                ChartOneRM(viewModel: viewModel, calculatorViewModel: calculatorViewModel, activeInputIndex: $activeInputIndex)
                
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
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.saveCalculation(modelContext: modelContext, trainingType: selectedTraining)
                    }, label: {
                        Text("Save")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("1RM Calculator")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
