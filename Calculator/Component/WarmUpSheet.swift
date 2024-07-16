//
//  WarmUpSheet.swift
//  Calculator
//
//  Created by Retno Shintya Hariyani on 14/07/24.
//

import SwiftUI

struct WarmUpSheet: View {
    @ObservedObject var viewModel2: OneRepMaxViewModel
    @StateObject private var viewModel = WarmUpSheetViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Warm-Up Suggestion")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding([.horizontal, .top])
                Divider()
                VStack(alignment: .leading) {
                    Text("\(Text("Don't rush" ).foregroundStyle(.red).bold()) and build slowly. We recommend having a coach or spotter on hand to keep you safe and accountable.")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.top, 2)
                    Text("Perform sets as follow:")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                }
                                
                if let oneRepMax = viewModel2.oneRepMax {
                    WarmUpCard(number: 1, reps: "10-12", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax, percentage: 30.0)) kg")
                    WarmUpCard(number: 2, reps: "8-10", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax, percentage: 40.0)) kg")
                    WarmUpCard(number: 3, reps: "6-8", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax, percentage: 50.0)) kg")
                    WarmUpCard(number: 4, reps: "4-6", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax, percentage: 60.0)) kg")
                    WarmUpCard(number: 5, reps: "2-4", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax, percentage: 70.0)) kg")
                    WarmUpCard(number: 6, reps: "1-2", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax, percentage: 80.0)) kg")
                } else {
                    Text("No data")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                }
                
               Text("Once you hit a challenging 80-85%, build in smaller increments of 5% until you reach around 90-98%, then go for the single attempts. Time your rest periods for at least two minutes so that muscles can recover.")
                    .font(.subheadline)
                    .padding(.horizontal)
            }
            
        }
    }
    
}

#Preview {
    WarmUpSheet(viewModel2: OneRepMaxViewModel())
}
