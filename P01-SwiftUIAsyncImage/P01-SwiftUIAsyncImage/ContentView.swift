//
//  ContentView.swift
//  P01-SwiftUIAsyncImage
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import SwiftUI

struct ContentView: View {
    private let urlString: String = "https://immobiliensuche.me/src/images/image-phone.png"
    
    var body: some View {
        //MARK: Scale
        //AsyncImage(url: URL(string: urlString), scale: 3.0)
        
        //MARK: Placeholder
//        AsyncImage(url: URL(string: urlString)) { image in
//            image
//                .imageModifier()
//                
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
        
        //MARK: Phase
//        AsyncImage(url: URL(string: urlString)) { phase in
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "xmark.circle.fill")
//                    .iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40)
        
        //MARK: Phase with Animation
        AsyncImage(url: URL(string: urlString),
                   transaction: Transaction(animation: .spring(duration: 0.5, bounce: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "xmark.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

#Preview {
    ContentView()
}
