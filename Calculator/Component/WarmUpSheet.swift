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
        VStack {
            HStack {
                Text("Warm-Up Suggestion")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            
            let oneRepMax = viewModel2.oneRepMax
                
            WarmUpCard(number: 1, reps: "10-12", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax ?? 0, percentage: 70.0)) kg")
            
            WarmUpCard(number: 2, reps: "8-10", weight: "x \(viewModel.calculateWeightSuggestions(oneRepMax: oneRepMax ?? 0 , percentage: 80.0)) kg")
            
            Spacer()
        }
        
    }
    
    
}

#Preview {
    WarmUpSheet(viewModel2: OneRepMaxViewModel())
}
