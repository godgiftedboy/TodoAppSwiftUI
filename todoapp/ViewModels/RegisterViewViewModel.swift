//
//  RegisterViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel:ObservableObject{
    @Published var name="";
    @Published var email="";
    @Published var password="";
    @Published var errorMsg="";
    init()
    {
    }
    
    func register(){
        guard validate() else {
            return
        }
        
        //completion is a closure passed as argument in a function createUser.
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            // Use [weak self] when self might be deallocated before the closure executes (e.g., network calls, Firebase calls, animations).
            [weak self] result, error -> Void in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        })

        errorMsg =  ""
    }
    
    private func insertUserRecord(id: String){
        let newUser =   User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970);
        let db = Firestore.firestore();
        db.collection("user")
            .document(id)
            .setData(newUser.asDictionary())
        
        
        
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,!email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg =  "Please fill required fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMsg =  "Please enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMsg =  "Please enter a valid email"
            return false
        }
        return true;
    }
}
