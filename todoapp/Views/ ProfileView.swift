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
                        Text("Usernmae")
                    }.padding()
                    HStack{
                        Text("Email")
                            .bold()
                        Text("Usernmae")
                    }.padding()
                    HStack{
                        Text("Member Since")
                            .bold()
                        Text("Usernmae")
                    }.padding()
                }
                )
                
                //Sign out
                CustomButton(title: "Logout", background: .blue, action: {
                    //logout action
                })
                .frame(height: 80)
                .padding()
                
                Spacer()
                
            }.navigationTitle("Profile")
        }
        //equivalent to:
        //        NavigationView(content: {
        //            VStack {
        //                // Your views here
        //            }.navigationTitle("Profile")
        //        })
    }
}

#Preview {
    _ProfileView()
}
