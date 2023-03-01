//
//  ContentView.swift
//  Notes
//
//  Created by Хайдар Даукаев on 01.03.2023.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var notes = Notes()
    @State private var showingAddNewNote = false
    
    
    // List of notes
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes.items, id: \.self) { note in
                    NavigationLink(destination: CurrNote(id: note.id, title: note.title,
                                                             mainText: note.mainText,
                                                             notes: notes)) {
                        Text(note.title)
                    }
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
                Button {
                    self.showingAddNewNote = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddNewNote) {
                    NewNoteView(notes: self.notes)
                }
            }
            .navigationTitle("Notes")
        }
    }

    private func delete(at offsets: IndexSet) {
        notes.items.remove(atOffsets: offsets)
    }
    
    private func addItemRow() {
        let note = Note(title: "Some note", mainText: "Test text")
        self.notes.items.append(note)
    }

}
    

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
