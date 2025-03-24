//
//  LoginView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel();
    var body: some View {
        NavigationView{
            VStack{
                
                //Header View
                HeaderView(
                    title: "Todo List",
                    subTitle: "Getting Things done",
                    angle: 15,
                    background: .pink
                )
                
               
                //Login Form
                Form{
                    if !viewModel.errorMsg.isEmpty{
                        
                        Text(viewModel.errorMsg).foregroundColor(Color.red)
                    }
                    TextField("Email address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    CustomButton(title: "Login", background: .blue){
                        //Login Action
                        viewModel.login()
                    }
                } .padding(.top, -50)
                
                //Create Account
                VStack{
                    Text(
                        "Dont have an account?"
                    )
                 
                    
                    NavigationLink(destination: RegisterView(), label: {
                        Text("Create an account")
                    })
                }.padding(.bottom,50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
    
   
}
