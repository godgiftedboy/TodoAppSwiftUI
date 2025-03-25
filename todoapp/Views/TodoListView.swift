//
//  TodoListView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    //instead of creating a instance of view model here as in other views.
    //it is used as wrapped property below in constructor
    @StateObject var viewModel: TodoListViewViewModel;
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String;
    
    init(userId: String ) {
        self.userId = userId
        
        //our todos are located at below in Firestore.
        // user/<id>/todos/<entries>
        //underscore is conevtion for property wrapper -  @FirestoreQuery is a property wrapper.
        self._items = FirestoreQuery(collectionPath: "user/\(userId)/todos")
        //wrapped property viewModel with wrapped value of viewModel instance.
        self._viewModel = StateObject(
            wrappedValue: TodoListViewViewModel(userId: userId))
        
        //wrapped property is used inorder to pass userId on constructor and use the userId for delete operation.
 
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in
                    TodoListItemView(item: item)
                        .swipeActions(content: {
                            Button{
                                //Delete action
                                viewModel.delete(id: item.id)
                                
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        })
                }
                .listStyle(PlainListStyle())
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
                    //passing binding to child view
                    newItemPresented: $viewModel.showingNewItemView
                )
                
            })
        }
    }
}

#Preview {
    TodoListView(
        userId: "nL4MVAhHRJh5jDZWTJF2waOHA0C3"
    )
}
