//
//  WarmUpCard.swift
//  Calculator
//
//  Created by Retno Shintya Hariyani on 14/07/24.
//

import SwiftUI

struct WarmUpCard: View {
    var number: Int
    var reps: String
    var weight: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 361, height: 73)
                .background(.sheetPage2)
                .cornerRadius(50)

            HStack {
                ZStack {
                    Circle()
                        .frame(width: 52, height: 51)
                        .foregroundColor(Color(red: 1, green: 0.58, blue: 0))

                    Text("\(number)")
                        .font(.system(size: 32))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.tulisanPutihHitam)
                        .fontWeight(.bold)
                }
                .padding(.leading)

                VStack(alignment: .leading) {
                    Text("Repetition")
                        .foregroundColor(.tulisanHitamPutih)
                        .fontWeight(.semibold)

                    Text(reps)
                        .foregroundColor(.tulisanHitamPutih)
                }
                .padding(.leading, 10)

                Spacer()

                Text(weight)
                    .foregroundColor(Color(red: 1, green: 0.58, blue: 0))
                    .fontWeight(.semibold)
                    .frame(width: 85, alignment: .center)
                    .padding(.trailing)
            }
            
            .padding(.vertical, 10)
            .cornerRadius(50)
            .padding(.horizontal, 20)
            
        }
        
        
    }
}


#Preview {
    WarmUpCard(number: 1, reps: "10-12", weight: "x 70 kg")
}
