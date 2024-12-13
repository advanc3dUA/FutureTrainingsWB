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
    @State private var isAnimatingButton = false
    
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
                        .sheet(isPresented: $isShowingAddToDoView) {
                            AddToDoView()
                        }
                    }
                } //: TOOLBAR
                
                //MARK: - NO TODO ITEMS
                if fetchedTodos.isEmpty {
                    EmptyListView()
                }
            } //: ZSTACK
//            .sheet(isPresented: $isShowingAddToDoView) {
//                AddToDoView()
//            }
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(.blue)
                            .opacity(isAnimatingButton ? 0.2 : 0)
                            .scaleEffect(isAnimatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        
                        Circle()
                            .fill(.blue)
                            .opacity(isAnimatingButton ? 0.15 : 0)
                            .scaleEffect(isAnimatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    Button {
                        isShowingAddToDoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    } //: BUTTON
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            isAnimatingButton.toggle()
                        }
                    }
                    
                } //: ZSTACK
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                , alignment: .bottomTrailing
            )
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
