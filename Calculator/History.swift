//
//  History.swift
//  Calculator
//
//  Created by Renaldi Antonio on 12/07/24.
//

import Foundation

class History: Identifiable {
    var id: UUID
    var date: Date
    var rm: Int
    
    init(date: Date, rm: Int) {
        self.date = date
        self.rm = rm
        self.id = UUID()
    }
}
