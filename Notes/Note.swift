//
//  Note.swift
//  Notes
//
//  Created by Хайдар Даукаев on 01.03.2023.
//

import SwiftUI

// Note model
struct Note: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var title: String
    var mainText: String
    
}

var welcomeTitle = "Welcome!"
var firsMainText = "Press Save before quit from editing note!\nYou can delete a note swiping it left"


class Notes: ObservableObject {
    @Published var items = [Note(title: welcomeTitle,
                                 mainText: firsMainText)] {
        
    // Saving in JSON
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Note].self,
                                                 from: items) {
                self.items = decoded
                return
            }
        }
    }
}
