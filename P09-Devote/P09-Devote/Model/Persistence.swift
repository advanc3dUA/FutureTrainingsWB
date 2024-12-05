//
//  Persistence.swift
//  P09-Devote
//
//  Created by Yuriy Gudimov on 05.12.24.
//

import CoreData

struct PersistenceController {
    //MARK: - Persistent controller
    static let shared = PersistenceController()

    //MARK: - Persistent container
    let container: NSPersistentContainer

    //MARK: - Initialization
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "P09_Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    //MARK: - Preview
    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Task \(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
