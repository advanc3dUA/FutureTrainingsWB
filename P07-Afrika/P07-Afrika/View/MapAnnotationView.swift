//
//  MapAnnotationView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 03.12.24.
//

import SwiftUI

struct MapAnnotationView: View {
    let location: NationalParkLocation
    @State private var animation = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    MapAnnotationView(location: locations[0])
        .padding()
}
