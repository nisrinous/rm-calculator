//
//  TabNavigationView.swift
//  Calculator
//
//  Created by Nur Nisrina on 11/07/24.
//

import SwiftUI

struct TabNavigationView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Label("1RM Calc", systemImage: "dumbbell")
                }
            
            SecondTabView()
                .tabItem {
                    Label("Rep Max", systemImage: "percent")
                }
            
            HistoryTabView()
                .tabItem {
                    Label("History", systemImage: "clock.arrow.2.circlepath")
                }
        }
        .accentColor(.primaryOrange)
    }
}

struct FirstTabView: View {
    var body: some View {
        OneRepMaxView()
    }
}

struct SecondTabView: View {
    var body: some View {
        TrainingWeightView()
    }
}

struct HistoryTabView: View {
    var body: some View {
        HistoryView()
    }
}

#Preview {
    TabNavigationView()
}
