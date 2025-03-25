//
//  NewItemViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewViewModel: ObservableObject{
    @Published var title: String = "";
    @Published var dueData = Date();
    @Published var showAlert = false;
    init(){
    }
    //save the item as a sub collection inside a users collection
    func save(){
        //save aciton
        
        //cross check as already check in UI on validation
        guard canSave else{
            return
        }
        //Get current Userid
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create model
        
        let newUUID = UUID().uuidString;
        let newItem = TodoListItem(
                            id: newUUID,
                            title: title,
                            dueDate: dueData.timeIntervalSince1970,
                            createdDate: Date().timeIntervalSince1970,
                            isDone: false
                        );
        
        //Save
        let db = Firestore.firestore();
        db.collection("user")
            .document(uId)
            .collection("todos")
            .document(newUUID)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false;
        }
        guard dueData >= Date().addingTimeInterval(-86400) else{
            return false;
        }
        return true;
        
    }
}
