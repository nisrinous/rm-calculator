//
//  HistoryView.swift
//  Calculator
//
//  Created by Renaldi Antonio on 12/07/24.
//

import SwiftUI
import SwiftData
import Charts

let trainings = [
    "Bench Press",
    "Bicep Curl"
]

struct HistoryView: View {
    @State var selectedTraining = trainings[0]
    @Query var histories: [History]
    
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
        
        NavigationView(content: {
            VStack(alignment: .leading){
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
                
                VStack (alignment: .leading) {
                    if histories.isEmpty {
                        VStack{
                            Spacer()
                            HStack {
                                Spacer()
                                Text("You haven't added any data :)")
                                Spacer()
                            }
                        }
                        .frame(maxHeight: 50)
                    }
                    
                    Chart {
                        ForEach(histories){ history in
                            if history.trainingType == selectedTraining {
                                AreaMark(
                                    x: .value("Date", history.date, unit: .day),
                                    y: .value("1RM", history.oneRepMax)
                                )
                                .interpolationMethod(.catmullRom)
                                .foregroundStyle(curGradient)
                                LineMark(
                                    x: .value("Date", history.date, unit: .day),
                                    y: .value("1RM", history.oneRepMax)
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
                    }
                    .frame(height: 200)
                    .padding(.bottom)
                    Text("1RM History")
                        .font(.title2)
                        .bold()
                    Divider()
                    
                    ScrollView{
                        if histories.isEmpty {
                            HStack(){
                                Spacer()
                                Text("You haven't added any data :)")
                                Spacer()
                            }
                        }
                        ForEach(histories) { history in
                            if history.trainingType == selectedTraining {
                                HistoryCard(history: history)
                            }
                        }
                    }
                }
                .padding(.all)
                
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("History")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            
        })
    }
}

#Preview {
    HistoryView()
}
