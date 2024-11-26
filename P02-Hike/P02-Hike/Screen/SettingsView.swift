//
//  SettingsView.swift
//  P02-Hike
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            //MARK: - SECTION HEADER
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66))
                            .fontWeight(.black)
                        
                        Text("Editor's choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color.customGreenLight,
                            Color.customGreenMedium,
                            Color.customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeus in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust of the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION ICONS
            Section("Alternate Icons") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { index in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[index]) { error in
                                    if error != nil {
                                        print("There is an error: \(error!.localizedDescription)")
                                    } else {
                                        print("Successfully set alternate icon to \(alternateAppIcons[index]).")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[index])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All rights reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // Basic labeled content
//                LabeledContent("Application", value: "Hike")
                
                // Advanced labeled content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "advanc3d", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Website", rowLinkDestination: "https://futuretrainings.com")

            } // : SECTION
        } // : LIST
    }
}

#Preview {
    SettingsView()
}
