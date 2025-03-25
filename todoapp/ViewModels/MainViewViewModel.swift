//
//  MainViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation
import FirebaseAuth

class MainViewViewModel:ObservableObject{
    @Published var currentUserId: String = "";
    public var isSignedIn : Bool {
        Auth.auth().currentUser != nil;
    }
    //isSignedIn is Computed property.
    private var handler : AuthStateDidChangeListenerHandle?
    init(){
        //Auth.auth() accesses a singleton instance of Auth class
        //auth() is a class func - like a static func that can be overridden
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _,user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
   
}
