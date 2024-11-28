//
//  OnboardingView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 28.11.24.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                FruitCardView()
            }//: LOOP
        }//: TABVIEW
        .tabViewStyle(.page)
        .padding(.vertical, 20)
    }
}

//MARK: - PREVIEW
#Preview {
    OnboardingView()
}
