//
//  CustomBackgroundView.swift
//  P02-Hike
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: - DEPTH
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            //MARK: - LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //MARK: - SURFACE
            
            LinearGradient(colors: [Color(Color.customGreenLight),
                                    Color(Color.customGreenMedium)
                                   ],
                           startPoint: .top,
                           endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding(40)
}
