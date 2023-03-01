//
//  CurrNote.swift
//  Notes
//
//  Created by Хайдар Даукаев on 01.03.2023.
//

import SwiftUI


// Open and edit note view
struct CurrNote: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var id: UUID
    @State var title: String
    @State var mainText: String
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
                        if let i = self.notes.items.firstIndex(where: {$0.id == id}) {
                            self.notes.items[i] = item
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}
