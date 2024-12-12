//
//  ContentView.swift
//  P13-Todox
//
//  Created by Yuriy Gudimov on 12.12.24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var fetchedTodos: FetchedResults<Todo>
    
    private func deleteToDo(in indexSet: IndexSet) {
        indexSet.forEach { index in
            managedObjectContext.delete(fetchedTodos[index])
        }
        try? managedObjectContext.save()
    }
    
    @State private var isShowingAddToDoView = false
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(fetchedTodos, id: \.self) { fetchTodo in
                        HStack {
                            Text(fetchTodo.name ?? "Unknown")
                            Spacer()
                            Text(fetchTodo.priority ?? "Unknown")
                        }
                    } //: LOOP
                    .onDelete(perform: deleteToDo)
                } //: LIST
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isShowingAddToDoView.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                } //: TOOLBAR
                
                //MARK: - NO TODO ITEMS
                if fetchedTodos.isEmpty {
                    EmptyListView()
                }
            } //: ZSTACK
        } //: NAVIGATION
        .sheet(isPresented: $isShowingAddToDoView) {
            AddToDoView()
        }
    }
}

#Preview {
    let context = PersistenceController.shared.container.viewContext
    ContentView()
        .environment(\.managedObjectContext, context)
}
