//
//  ContentView.swift
//  P03-Restart
//
//  Created by Yuriy Gudimov on 26.11.24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") private var isOnboardingViewActive = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
