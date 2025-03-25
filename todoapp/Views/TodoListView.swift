//
//  TodoListView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel();
    
    private let userId: String;
    
    init(userId: String ) {
        self.userId = userId
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button (
                    action: {
                        //Action
                        viewModel.showingNewItemView = true;
                        },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(
                    newItemPresented: $viewModel.showingNewItemView
                )
                
            })
        }
    }
}

#Preview {
    TodoListView(userId: "UserID")
}
