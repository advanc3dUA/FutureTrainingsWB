//
//  SettingsView.swift
//  P10-Notes Watch App
//
//  Created by Yuriy Gudimov on 06.12.24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Double = 1.0
    
    private func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            // ACTUAL LINES
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(
                value: Binding(
                    get: { self.value },
                    set: {(newValue) in
                        self.value = newValue
                        update()
                    }
                ),
                in: 1...4,
                step: 1
            )
                .accentColor(.accent)
        }
    }
}

#Preview {
    SettingsView()
}
