//
//  TodoListItemView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: TodoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date.init(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button(
                action:{
                    //done action
                    viewModel.updateCheck(item: item);
                },
                label: {
                    Image( systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.blue)
                })
        }
    }
}

#Preview {
    TodoListItemView(item:  TodoListItem(id: "123", title: "asda", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
