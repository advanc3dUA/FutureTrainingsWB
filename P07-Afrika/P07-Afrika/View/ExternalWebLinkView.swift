//
//  ExternalWebLinkView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link("\(animal.name)", destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.net"))!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundStyle(.accent)
            }//: HSTACK
        }//: GROUPBOX
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    ExternalWebLinkView(animal: animals[0])
        .padding()
}
