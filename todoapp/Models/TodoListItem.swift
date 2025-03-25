//
//  TodoListItem.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation
struct TodoListItem: Codable, Identifiable{
    let id: String;
    let title: String;
    let dueDate: TimeInterval;
    let createdDate: TimeInterval;
    var isDone: Bool;
    
    mutating func setDone(_ state: Bool){
        isDone = state;
    }
    
    
}
