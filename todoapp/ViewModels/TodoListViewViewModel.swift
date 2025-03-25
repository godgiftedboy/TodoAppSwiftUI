//
//  TodoListViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//
///View model for todolist (item list)
import Foundation
import FirebaseFirestore
class TodoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false;
    
    private let userId:String
    init(userId:String){
        self.userId = userId;
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("user")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
