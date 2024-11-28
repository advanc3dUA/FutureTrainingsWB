//
//  StartButtonView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 28.11.24.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        Button {
            print("Exit onboarding")
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        }//: BUTTON
        .accentColor(.white)
    }
}

//MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    StartButtonView()
}
