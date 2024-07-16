//
//  HistoryCard.swift
//  Calculator
//
//  Created by Renaldi Antonio on 13/07/24.
//

import SwiftUI
import SwiftData

struct HistoryCard: View {
    var history: History
    
    var body: some View {
        VStack{
            HStack{
                informationMaker(title: "Weight", data: String(history.weight), matrix: "kg")
                Spacer()
                dividerMaker()
                Spacer()
                informationMaker(title: "Repetition", data: String(history.repetitions), matrix: "reps")
                Spacer()
                dividerMaker()
                Spacer()
                informationMaker(title: "1RM", data: String(format: "%.1f", history.oneRepMax), matrix: "kg")
//                    .padding(.trailing, 20)
                Spacer()
                Text(formatDate(date: history.date))
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            .padding([.all])
        }
        .background(
            .secondaryGrey
        )
        .clipShape(
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
        )
//        .padding(.horizontal)
    }
}

func informationMaker(title: String, data: String, matrix: String) -> some View {
    
    VStack{
        Text(title)
            .font(.system(size: 14))
            .foregroundStyle(.historyInfo)
            .bold()
        HStack(alignment: .bottom){
            Text(data)
                .foregroundStyle(.primaryOrange)
                .font(.system(size: 18))
                .bold()
            Text(matrix)
                .padding(.horizontal, -5)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: 100, idealHeight: 20)
    }
}

func dividerMaker() -> some View {
    Divider()
        .frame(height: 50)
//        .overlay(Color.white)
}

func formatDate(date: Date) -> String{
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "dd MMM"
    return dateFormatter.string(from: date)
}

#Preview {
    HistoryCard(history: History(date: Date.now, weight: 20, repetitions: 10, oneRepMax: 50, trainingType: "Bench Press"))
}
