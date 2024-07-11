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
                    Label("Calculator", systemImage: "minus.forwardslash.plus")
                }
            
            SecondTabView()
                .tabItem {
                    Label("Table", systemImage: "tablecells")
                }
            
            HistoryTabView()
                .tabItem {
                    Label("History", systemImage: "book")
                }
            PlannerTabView()
                .tabItem {
                    Label("Planner", systemImage: "book.closed")
                }
        }
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
        Text("History view")
    }
}

struct PlannerTabView: View {
    var body: some View {
        Text("Planner view")
    }
}

#Preview {
    TabNavigationView()
}
