//
//  OneRepMaxView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI

struct OneRepMaxView: View {
    @StateObject private var viewModel = OneRepMaxViewModel()
    @State private var isShowingDetail = false
    
    var body: some View {
        NavigationView {
            VStack {
                ChartOneRM(viewModel: viewModel) // Pass viewModel to ChartOneRM
                
                Button(action: {
                    isShowingDetail = true
                }) {
                    Text("Warm-Up")
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
