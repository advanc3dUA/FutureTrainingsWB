//
//  ContentView.swift
//  P03-Wishlist
//
//  Created by Yuriy Gudimov on 27.11.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }//: LIST
            .navigationTitle(Text("Wishlist"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing, actions: {
                TextField("Enter a new wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }

            })
            
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started."))
                }
            }
        }//: NAVIGATION STACK
    }
}

#Preview("List with sample data") {
    let container = try! ModelContainer(for: Wish.self, configurations: .init(isStoredInMemoryOnly: true))
    container.mainContext.insert(Wish(title: "Get up early"))
    container.mainContext.insert(Wish(title: "Clean your teeth"))
    container.mainContext.insert(Wish(title: "Eat something"))
    container.mainContext.insert(Wish(title: "Code"))
    container.mainContext.insert(Wish(title: "Sleep"))
    container.mainContext.insert(Wish(title: "Repeat"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty list") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
