//
//  NewItemViewViewModel.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation
class NewItemViewViewModel: ObservableObject{
    @Published var title: String = "";
    @Published var dueData = Date();
    @Published var showAlert = false;
    init(){
    }
    
    func save(){
        //save aciton
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
