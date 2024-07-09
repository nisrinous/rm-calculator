//
//  ContentView.swift
//  Calculator
//
//  Created by Nur Nisrina on 09/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var selectedView = 0

    var views: [AnyView] = [
        AnyView(OneRepMaxView()),
        AnyView(TrainingWeightView())
    ]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select View", selection: $selectedView) {
                    Text("1RM Calculator").tag(0)
                    Text("Training Weight").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                views[selectedView]
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        if selectedView == 0 {
                            Text("Save")
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
