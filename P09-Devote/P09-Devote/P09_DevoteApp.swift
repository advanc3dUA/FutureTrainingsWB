//
//  P09_DevoteApp.swift
//  P09-Devote
//
//  Created by Yuriy Gudimov on 05.12.24.
//

import SwiftUI

@main
struct P09_DevoteApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
