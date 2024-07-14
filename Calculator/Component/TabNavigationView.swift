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
                    Label("Calculator", systemImage: "equal")
                }
            
            SecondTabView()
                .tabItem {
                    Label("Table", systemImage: "dumbbell")
                }
            
            HistoryTabView()
                .tabItem {
                    Label("History", systemImage: "star")
                }
            PlannerTabView()
                .tabItem {
                    Label("Planner", systemImage: "list.bullet.clipboard")
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
