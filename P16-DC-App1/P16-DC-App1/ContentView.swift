//
//  ContentView.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 30.01.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            title
            VStack(spacing: 250) {
                ForEach(cards) { card in
                    CardView(card: card)
                        .scrollTransition { view, phase in
                            view
                                .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                .rotationEffect(.degrees(phase.isIdentity ? 0 : -30))
                                .rotation3DEffect(.degrees(phase.isIdentity ? 0 : 60), axis: (x: -1, y: 1, z: 0))
                                .blur(radius: phase.isIdentity ? 0 : 10)
                                .offset(x: phase.isIdentity ? 0 : -200)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
    }
    
    var title: some View {
        VStack(alignment: .leading) {
            Text("Explore")
                .font(.largeTitle.weight(.bold))
            Text("\(Date().formatted(date: .complete, time: .omitted))")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    ContentView()
}
