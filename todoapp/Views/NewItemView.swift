//
//  NewItemView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
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
                    viewModel.save();
                    newItemPresented = false;
                    
                })
                .padding()
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}
