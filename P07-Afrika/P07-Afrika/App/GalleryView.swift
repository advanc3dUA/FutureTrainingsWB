//
//  GalleryView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import SwiftUI

struct GalleryView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    private let haptic = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns: Double = 3.0
    
    private func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumns))
    }
        
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 8)
                    )
                
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .onChange(of: gridColumns) {
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke().foregroundStyle(.white))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptic.impactOccurred()
                            }
                    } //: LOOP
                }) //: VGRID
                .onAppear {
                    gridSwitch()
                }
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
