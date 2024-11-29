//
//  ContentView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 28.11.24.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let fruits: [Fruit] = fruitsData
    @State private var isShowingProperties: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRawView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .toolbar (content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingProperties = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }//: BUTTON
                    .sheet(isPresented: $isShowingProperties) {
                        SettingsView()
                    }
                }
            })
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
