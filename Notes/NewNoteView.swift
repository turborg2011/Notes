//
//  NewNoteView.swift
//  Notes
//
//  Created by Хайдар Даукаев on 01.03.2023.
//


import SwiftUI


// View to create note
struct NewNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var mainText = "..."
    @ObservedObject var notes: Notes
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $title)
                    .padding()
                    .font(.largeTitle)
                TextEditor(text: $mainText)
                    .padding()
            }
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        let item = Note(title: self.title, mainText: self.mainText)
                        self.notes.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }

                }
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(notes: Notes())
    }
}
