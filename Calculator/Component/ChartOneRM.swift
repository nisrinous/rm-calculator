
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
    @State private var activeField: CustomKeyboardField? = nil
    
    @State private var macros: [MacroData] = []
    
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
                            .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.12))
                            .font(.system(size: 48))
                            .bold()
                            .opacity(0.7)
                    } else {
                        Text("0.0") // Default display when oneRepMax is nil
                            .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.12))
                            .font(.system(size: 48))
                            .bold()
                            .opacity(0.7)
                    }
                    
                    Text("kg")
                        .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.12))
                        .font(.system(size: 16))
                        .opacity(0.7)
                }
            }
            
//                        HStack {
//                            TextField("Weight", text: $viewModel.weight)
//                                .keyboardType(.numberPad)
//                                .padding()
//                                .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
//                                .cornerRadius(10)
//                                .padding(.leading, 20)
//                                .onChange(of: viewModel.weight) { newValue in
//                                    viewModel.calculateOneRepMax()
//                                    updateMacros()
//                                }
//            
//                            Text("kg")
//                                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
//
//                            TextField("Repetition", text: $viewModel.repetitions)
//                                .keyboardType(.numberPad)
//                                .padding()
//                                .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
//                                .cornerRadius(10)
//                                .padding(.leading, 20)
//                                .onChange(of: viewModel.repetitions) { newValue in
//                                    viewModel.calculateOneRepMax()
//                                    updateMacros()
//                                }
//            
//                            Text("reps")
//                                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
//                        }
//                        .padding(.vertical, 5)
//                        .padding(.horizontal)
            
            //custom field
            
            HStack(alignment: .center, spacing: 95) {
                
                HStack(alignment: .center, spacing: 0){
                    CustomTextField(text: $viewModel.weight, activeField: $activeField)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 7)
                        .frame(width: 90, height: 1, alignment: .leading)
                        .onChange(of: viewModel.weight) { newValue in
                            viewModel.calculateOneRepMax()
                            updateMacros()
                        }
                    
                    Text("kg")
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                
                HStack(alignment: .center, spacing: 0){
                    CustomTextField(text: $viewModel.repetitions, activeField: $activeField)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.vertical, 7)
                        .frame(width: 90, height: 1, alignment: .leading)
                        .onChange(of: viewModel.repetitions) { newValue in
                            viewModel.calculateOneRepMax()
                            updateMacros()
                        }
                    
                    Text("reps")
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                
              
            }
            .padding(.leading, 16)
            .padding(.vertical, 22)
            .frame(width: 351, alignment: .leading)
        }
        .onAppear {
            updateMacros()
        }
    }
    
    private func updateMacros() {
        let percentage = viewModel.calculatePercentages()
        let oneRepMax = viewModel.oneRepMax

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

#Preview {
    ChartOneRM(viewModel: OneRepMaxViewModel())
}




