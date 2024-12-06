//
//  ContentView.swift
//  P10-Notes Watch App
//
//  Created by Yuriy Gudimov on 06.12.24.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = []
    @State private var text: String = ""
    @AppStorage("lineCount") var lineCount = 1
    
    private func save() {
//        dump(notes)
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data failed!")
        }
    }
    
    private func load() {
        DispatchQueue.main.async {
            do {
                let data = try Data(contentsOf: getDocumentDirectory().appendingPathComponent("notes"))
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Failed to load data")
            }
        }
    }
    
    private func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Enter note", text: $text)
                
                Button {
                    guard text.isEmpty == false else { return }
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundStyle(.accent)

                    
            } //: HSTACK
            Spacer()
            
            if !notes.isEmpty {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundStyle(.accent)
                                
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        }
                    } //: LOOP
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
        } //: VSTACK
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
    }
}

#Preview {
    ContentView()
}
