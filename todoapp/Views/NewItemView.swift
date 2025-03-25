//
//  NewItemView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    //passed binding from parent view
    @Binding var newItemPresented: Bool;
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            
            Form{
                TextField("Title",text:$viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date",selection: $viewModel.dueData)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                CustomButton(title: "Save", background: Color.pink, action: {
                    //save action
                    
                    if(viewModel.canSave){
                        viewModel.save();
                        newItemPresented = false;
                    }else{
                        viewModel.showAlert = true;
                    }
                    
                    
                })
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(
                    title: Text("Error") ,
                    message: Text("Please select valid date")
                )
            }
        }
    }
}

#Preview {
    //passed binding in a preview with getter and setter
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}
