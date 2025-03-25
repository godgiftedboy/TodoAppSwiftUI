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
    init(){
    }
    
    func save(){
        //save aciton
    }
}
