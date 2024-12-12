//
//  AddToDoView.swift
//  P13-Todox
//
//  Created by Yuriy Gudimov on 12.12.24.
//

import SwiftUI

struct AddToDoView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var priority: String = "Normal"
    let priopities: [String] = ["Low", "Normal", "High"]
    
    @State private var isShowingError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Todo", text: $name)
                    
                    Picker(selection: $priority) {
                        ForEach(priopities, id: \.self) { priority in
                            Text(priority)
                        }
                    } label: {
                        Text("Priority")
                    }
                    .pickerStyle(.segmented)
                    
                    Button {
                        if !name.isEmpty {
                            let newTodo = Todo(context: managedObjectContext)
                            newTodo.name = name
                            newTodo.priority = priority
                            try? managedObjectContext.save()
                            print("Saved")
                        } else {
                            errorTitle = "Invalid name"
                            errorMessage = "Please enter a correct title for the todo item."
                            isShowingError = true
                            return
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                    }

                } //: FORM
            } //: VSTACK
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
//            .alert(isPresented: $isShowingError) {
//                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
            .alert(Text(errorTitle), isPresented: $isShowingError) {
                Button {
                } label: {
                    Text("OK")
                }
            } message: {
                Text(errorMessage)
            }

        } //: NAVIGATION
    }
}

#Preview {
    AddToDoView()
}
