
//
//  ChartOneRM.swift
//  Calculator
//
//  Created by Retno Shintya Hariyani on 12/07/24.
//

import Charts
import SwiftUI

struct MacroData {
    let name: String
    let value: Int
    let color: Color
}

enum CustomKeyboardField {
    case weight
    case repetitions
}

struct ChartOneRM: View {
    @ObservedObject var viewModel: OneRepMaxViewModel
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    @State private var activeField: CustomKeyboardField? = nil
    
    @State private var macros: [MacroData] = []
    @Binding var activeInputIndex: Int
    @State private var isShowingDetail = false
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        VStack {
            Text("Your Estimated 1RM")
                .padding(.vertical, 7)
                .font(.system(size: 15))
                .foregroundColor(Color(red: 1, green: 0.58, blue: 0))
                .fontWeight(.semibold)
            
            ZStack {
                Chart(macros, id: \.name) { macro in
                    SectorMark(
                        angle: .value("Macros", macro.value),
                        innerRadius: .ratio(0.790)
                    )
                    .foregroundStyle(Color(macro.color))
                }
                .frame(width: 196, height: 196, alignment: .leading)
                .chartXAxis(.visible)

                
                VStack {
                    if let oneRepMax = viewModel.oneRepMax {
                        Text("\(oneRepMax, specifier: "%.1f")")
                            .foregroundColor(.nol)
                            .font(.system(size: 48))
                            .bold()
                            .opacity(0.7)
                    } else {
                        Text("0,0") // Default display when oneRepMax is nil
                            .foregroundColor(.nol)
                            .font(.system(size: 48))
                            .bold()
                            .opacity(0.7)
                    }
                    
                    Text("kg")
                        .foregroundColor(.nol)
                        .font(.system(size: 16))
                        .opacity(0.7)
                        .bold()
                }
            }
             
            //custom field
            
            HStack(alignment: .center, spacing: 95) {
                
                HStack(alignment: .center, spacing: 0){
                    CustomTextField(text: $calculatorViewModel.displays[0], activeField: $activeField)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 7)
                        .frame(width: 90, height: 1, alignment: .leading)
                        .onTapGesture {
                            activeInputIndex = 0
                            hideKeyboard()
                        }

                    
                    Text("kg")
                        .foregroundColor(.kgHome)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                
                HStack(alignment: .center, spacing: 0){
                    CustomTextField(text: $calculatorViewModel.displays[1], activeField: $activeField)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 7)
                        .frame(width: 90, height: 1, alignment: .leading)
                        .onTapGesture {
                            activeInputIndex = 1
                            hideKeyboard()
                        }

                    
                    Text("reps")
                        .foregroundColor(.kgHome)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
              
            }
            .padding(.leading, 16)
            .padding(.vertical, 10)
            .frame(width: 351, alignment: .leading)
            
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
                    .background(.sheetPage1)
                    .presentationDetents([.fraction(0.5), .medium, .large])
            }
            .padding(.bottom, 1)
            
            Spacer()
            CalculatorButtonsView(calculatorViewModel: calculatorViewModel, activeInputIndex: $activeInputIndex)
            Spacer()
        }
        .onAppear {
            updateMacros()
        }
        .onChange(of: calculatorViewModel.displays[0]) {
            if calculatorViewModel.displays[0].isEmpty {
                viewModel.weight = ""
                viewModel.calculateOneRepMax()
                updateMacros()
            } else if let weight = Double(calculatorViewModel.displays[0]) {
                viewModel.weight = String(weight)
                viewModel.calculateOneRepMax()
                updateMacros()
            }
        }
        .onChange(of: calculatorViewModel.displays[1]) {
            if calculatorViewModel.displays[1].isEmpty {
                viewModel.repetitions = ""
                viewModel.calculateOneRepMax()
                updateMacros()
            } else if let repetitions = Int(calculatorViewModel.displays[1]) {
                viewModel.repetitions = String(repetitions)
                viewModel.calculateOneRepMax()
                updateMacros()
            }
        }
    }
    
    private func updateMacros() {
        let percentage = viewModel.calculatePercentages()
        _ = viewModel.oneRepMax

        if percentage == 0 {
            macros = [
                .init(name: "Current 1RM", value: 0, color: Color(red: 0.89, green: 0.89, blue: 0.9)),
                .init(name: "1RM", value: 100, color: Color(red: 0.89, green: 0.89, blue: 0.9))
            ]
        } else {
            macros = [
                .init(name: "Current 1RM", value: percentage, color: Color(red: 1, green: 0.58, blue: 0)),
                .init(name: "1RM", value: 100 - percentage, color: Color(red: 0.89, green: 0.89, blue: 0.9))
            ]
        }
    }
    

}






