//
//  TodoListItemViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

///View model for single item in a todolist (each row in  a item list)
import Foundation
import FirebaseAuth
import FirebaseFirestore
class TodoListItemViewViewModel: ObservableObject{
    init(){
    }
    func updateCheck(item: TodoListItem){
        var itemCopy = item;
        itemCopy.setDone(!item.isDone);
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("user")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
    }
}
