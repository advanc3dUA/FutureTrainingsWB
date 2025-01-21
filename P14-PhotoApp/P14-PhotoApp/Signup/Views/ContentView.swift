//
//  ContentView.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 19.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ViewControllerWrapper(storyboardName: "Main", viewControllerIdentifier: "SignupViewController")
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
