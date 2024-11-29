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
    @AppStorage("isOnBoarding") var isOnBoarding = false
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    //MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height:  80)
                                .cornerRadius(8)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }
                    //MARK: - SECTION 2
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnBoarding) {
                            if isOnBoarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(
                                UIColor.tertiarySystemBackground
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    } label: {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    }

                    
                    //MARK: - SECTION 3
                    
                    GroupBox {
                        SettingsRawView(name: "Developer", content: "John / Jane")
                        SettingsRawView(name: "Designer", content: "Robert Petras")
                        SettingsRawView(name: "Compatibility", content: "iOS 14")
                        SettingsRawView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRawView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/RobertPetras")
                        SettingsRawView(name: "SwiftUI", content: "2.0")
                        SettingsRawView(name: "Version", content: "1.1.0")
                        
                    } label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    }

                    
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
