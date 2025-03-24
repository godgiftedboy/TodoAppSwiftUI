//
//  LoginViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation
import FirebaseAuth
class LoginViewViewModel:ObservableObject{
    @Published var email="";
    @Published var password="";
    @Published var errorMsg="";
    init()
    {
    }
    
    func login(){
        guard validate() else {
            return
        }
       
        Auth.auth().signIn(withEmail: email, password: password)

        errorMsg =  ""
        
        print("Login Sucess")
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg =  "Please fill required fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMsg =  "Please enter a valid email"
            return false
        }
        return true;
    }
}
