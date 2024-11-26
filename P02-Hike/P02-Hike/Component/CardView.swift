//
//  CardView.swift
//  P02-Hike
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber = 1
    @State private var randomNumber = 1
    @State private var isShowingSheet = false
    
    private func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        hikingTitle
                        Spacer()
                        hikingButton
                    }
                    hikingDescription
                }
                .padding(.horizontal, 30)
                .offset(y: -20)
                
                //MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                }
                
                exploreMoreButton
                    .offset(y: 10)
            }
            
            symbolImage
        }
        .frame(width: 320, height: 570)
    }
    
    var exploreMoreButton: some View {
        Button {
            randomImage()
        } label: {
            Text("Explore More")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color.customGreenLight,
                            Color.customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButtonStyle())
    }
    
    var symbolImage: some View {
        Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .padding()
            .offset(y: 30)
            .animation(.easeInOut(duration: 0.5), value: imageNumber)
    }
    
    var hikingTitle: some View {
        Text("Hiking")
            .fontWeight(.black)
            .font(.system(size: 52))
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        Color.customGrayLight,
                        Color.customGrayMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
    
    var hikingDescription: some View {
        Text("Fun and enjoyable outdoor activity for friends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundStyle(.colorGrayMedium)
    }
    
    var hikingButton: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            CustomButtonView()
        }
        .sheet(isPresented: $isShowingSheet) {
            SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    CardView()
}
