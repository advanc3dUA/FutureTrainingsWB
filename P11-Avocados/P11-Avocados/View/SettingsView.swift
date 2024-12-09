//
//  SettingsView.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct SettingsView: View {
    @State private var enableNotifications = true
    @State private var backgroundRefresh = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // HEADER
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: .colorBlackTransparentLight, radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif, weight: .bold))
                    .foregroundStyle(.colorGreenAdaptive)
            }
            .padding()
            
            Form {
                //MARK: - SECTION #1
                Section("General Settings") {
                    Toggle("Enable notifications", isOn: $enableNotifications)
                    
                    Toggle("Background refresh", isOn: $backgroundRefresh)
                }
                
                //MARK: - SECTION #2
                Section("Application") {
                    if enableNotifications {
                        HStack {
                            Text("Product").foregroundStyle(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack {
                            Text("Compatibility").foregroundStyle(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        HStack {
                            Text("Developer").foregroundStyle(.gray)
                            Spacer()
                            Text("Yuriy Gudimov")
                        }
                        HStack {
                            Text("Designer").foregroundStyle(.gray)
                            Spacer()
                            Text("John / Jane")
                        }
                        HStack {
                            Text("Website").foregroundStyle(.gray)
                            Spacer()
                            Text("google.com")
                        }
                        HStack {
                            Text("Version").foregroundStyle(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal Message").foregroundStyle(.gray)
                            Spacer()
                            Text("Happy coding!")
                        }
                    }
                    
                }
            }
        }
        .frame(maxWidth: 640)
    }
}

#Preview {
    SettingsView()
}
