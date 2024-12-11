//
//  InfoView.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 11.12.24.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            LogoView()
            
            Spacer()
            
            Form {
                Section("About the application") {
                    ExtractedView(firstItem: "Application", secondItem: "Slot Machine")
                    ExtractedView(firstItem: "Platforms", secondItem: "iPhone/iPad")
                    ExtractedView(firstItem: "Developer", secondItem: "Yuriy Gudimov")
                    ExtractedView(firstItem: "Designer", secondItem: "Someone else")
                    ExtractedView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    ExtractedView(firstItem: "Website", secondItem: "google.com")
                    ExtractedView(firstItem: "Copyright", secondItem: "♡ 2024 All Rights reserved")
                    ExtractedView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                dismiss.callAsFunction()
            }, label: {
                Image(systemName: "xmark.circle")
            })
            .font(.title)
            .padding(.top, 30)
            .padding(.trailing, 20)
            .tint(.secondary)
            , alignment: .topTrailing
        )
    }
}


struct ExtractedView: View {
    let firstItem: String
    let secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Text(secondItem)
        }
    }
}

#Preview {
    InfoView()
}
