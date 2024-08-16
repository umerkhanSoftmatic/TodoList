//
//  ItemModel.swift
// File

import Foundation

struct ItemModel: Identifiable, Codable {  // to make the model identifiable   // Codable means to make ItemModel code / decode to retrieve its data maybe in json format
    
    let id: String // = UUID().uuidString  // built in. generates random id
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    func updateCompletion() -> ItemModel {   //to mark checked / unchecked the list item
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    
}


