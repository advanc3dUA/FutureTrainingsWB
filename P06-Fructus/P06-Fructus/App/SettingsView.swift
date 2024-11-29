//
//  SettingsView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 29.11.24.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }//: VSTACK
            }//: SCROLL
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            })
            .padding()
        }//: NAVIGATION
    }
}

//MARK: - PREVIEW
#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
}
