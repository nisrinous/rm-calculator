//
//  HistoryViewModel.swift
//  Calculator
//
//  Created by Renaldi Antonio on 12/07/24.
//

import Foundation

class HistoryViewModel: ObservableObject {
    var histories : [History] = {
        let sampleDate = Date().startOfDay.adding(.month, value: -10)!
        var temp = [History]()
        
        // Line 1
        for i in 0..<8 {
            let value = Double.random(in: 5...20)
            temp.append(
                History(
                    date: sampleDate.adding(.month, value: i)!,
                    rm: Int(value)
                )
            )
        }
        
        return temp
    }()
}

// Buat testing

extension Date {
    func adding (_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
        return calendar.date(byAdding: component, value: value, to: self)
    }

    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}

