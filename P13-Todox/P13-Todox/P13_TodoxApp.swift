//
//  P13_TodoxApp.swift
//  P13-Todox
//
//  Created by Yuriy Gudimov on 12.12.24.
//

import SwiftUI

@main
struct P13_TodoxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
