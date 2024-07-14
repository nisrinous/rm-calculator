//
//  HistoryView.swift
//  Calculator
//
//  Created by Renaldi Antonio on 12/07/24.
//

import SwiftUI
import Charts

let trainings = [
    "Bench Press",
    "Bicep Curl"
]

struct HistoryView: View {
    @State var selectedTraining = trainings[0]
    @StateObject var viewModel = HistoryViewModel()
    
    var body: some View {
        let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    Color(.primaryOrange).opacity(0.5),
                    Color(.primaryOrange).opacity(0.2),
                    Color(.primaryOrange).opacity(0.05),
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        
        )
        
        VStack(alignment: .leading){
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
//            Spacer()
            
            Chart {
                ForEach(viewModel.histories){ history in
                    AreaMark(
                        x: .value("Date", history.date),
                        y: .value("1RM", history.rm)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(curGradient)
                    LineMark(
                        x: .value("Date", history.date),
                        y: .value("1RM", history.rm)
                    )
                    .foregroundStyle(.primaryOrange)
                    .interpolationMethod(.catmullRom)
                    .lineStyle(.init(lineWidth: 2))
                    .symbol {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 18)
                            .overlay(
                                Circle()
                                    .fill(.primaryOrange)
                                    .frame(width: 12)
                            )
                    }
                    
                }
            }
            .frame(height: 360)
            .padding(.bottom)
            
            Text("1RM History")
                .font(.title2)
            Divider()
            
            ScrollView{
                ForEach(viewModel.histories) { history in
                    HistoryCard()
                }
            }
            
            Spacer()
        }
        .padding(.all)
    }
}

#Preview {
    HistoryView()
}
