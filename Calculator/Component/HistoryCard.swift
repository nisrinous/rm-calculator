//
//  HistoryCard.swift
//  Calculator
//
//  Created by Renaldi Antonio on 13/07/24.
//

import SwiftUI

struct HistoryCard: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Ini Tanggal")
                    .font(.system(size: 10))
            }
            .padding([.trailing, .top])
            HStack{
                informationMaker(title: "Weight", data: "50", matrix: "kg")
                Spacer()
                dividerMaker()
                Spacer()
                informationMaker(title: "Repetition", data: "5", matrix: "reps")
                Spacer()
                dividerMaker()
                Spacer()
                informationMaker(title: "1RM", data: "70", matrix: "kg")
            }
            .padding([.bottom, .horizontal])
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
            .bold()
        HStack(alignment: .bottom){
            Text(data)
                .foregroundStyle(.primaryOrange)
                .font(.system(size: 30))
                .frame(height: 25)
            Text(matrix)
                .bold()
        }
    }
}

func dividerMaker() -> some View {
    Divider()
        .frame(height: 50)
        .overlay(Color.white)
}

#Preview {
    HistoryCard()
}
