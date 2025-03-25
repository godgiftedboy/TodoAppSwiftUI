//
//   ProfileView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct _ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel();
    var body: some View {
        //Trailing Closure syntax
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profileView(user: user)
                }else{
                    Text("Loading profile.....")
                }
                
            }.navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        //equivalent to:
        //        NavigationView(content: {
        //            VStack {
        //                // Your views here
        //            }.navigationTitle("Profile")
        //        })
    }
    @ViewBuilder
    func profileView(user: User) -> some View{
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125,height: 125)
            .padding()
    
        //Info: Name, Email
        VStack(alignment: .leading, content: {
            HStack{
                Text("Name")
                    .bold()
                Text(user.name)
            }.padding()
            HStack{
                Text("Email")
                    .bold()
                Text(user.email)
            }.padding()
            HStack{
                Text("Member Since")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated,time: .shortened))")
            }.padding()
        }
        )
        
        //Sign out
        CustomButton(title: "Logout", background: .blue, action: {
            //logout action
            viewModel.logout()
        })
        .frame(height: 80)
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    _ProfileView()
}
