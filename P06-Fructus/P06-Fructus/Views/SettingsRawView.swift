//
//  SettingsRawView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 29.11.24.
//

import SwiftUI

struct SettingsRawView: View {
    //MARK: - PROPERTIES
    let name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundStyle(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkLabel != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image (systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 475, height: 60)) {
    SettingsRawView(name: "Developer", content: "John / Jane")
    .padding()
    
}
