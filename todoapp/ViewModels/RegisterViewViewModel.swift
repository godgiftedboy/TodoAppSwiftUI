//
//  RegisterViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//


import Foundation
import FirebaseAuth

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
       
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            [weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        })

        errorMsg =  ""
        
        print("Login Sucess")
    }
    
    private func insertUserRecord(id: String){
        let newUser =   User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970);
        
        
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
