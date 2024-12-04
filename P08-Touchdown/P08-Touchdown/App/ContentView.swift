//
//  ContentView.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.connectedScenes
                        .compactMap { $0 as? UIWindowScene }
                        .flatMap { $0.windows }
                        .first { $0.isKeyWindow }?.safeAreaInsets.top ?? 0)
                    .background(.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView {
                    VStack(spacing: 0) {
                        FeaturedTabView()
                            .frame(minHeight: 300)
                            .padding(.vertical, 20)
                        
                        FooterView()
                            .padding(.horizontal)
                    } // VSTACK
                } // SCROLL
                .scrollIndicators(.hidden)
                
            } //: VSTACK
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        } // : ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    ContentView()
}
