//
//  HeaderView.swift
//  P10-Notes Watch App
//
//  Created by Yuriy Gudimov on 06.12.24.
//

import SwiftUI

struct HeaderView: View {
    var title: String? = nil
    
    var body: some View {
        VStack {
            // TITLE
            if title != nil {
                Text(title!.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            // SEPARATOR
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundStyle(.accent)
        }
    }
}

#Preview("With title") {
    HeaderView(title: "Hello, World!")
}

#Preview("Without title") {
    HeaderView()
}
