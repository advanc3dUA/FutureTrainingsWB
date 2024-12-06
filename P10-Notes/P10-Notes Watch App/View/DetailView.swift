//
//  DetailView.swift
//  P10-Notes Watch App
//
//  Created by Yuriy Gudimov on 06.12.24.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HeaderView()
            // CONTENT
            
            Spacer()
            
            ScrollView {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
            }
            .foregroundStyle(Color.secondary)
            
        }//: VSTACK
        .padding(3)
    }
}

#Preview {
    var sampleData: Note = Note(id: UUID(), text: "Hello, World!")
    DetailView(note: sampleData, count: 5, index: 1)
}
