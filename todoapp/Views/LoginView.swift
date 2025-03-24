//
//  LoginView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct LoginView: View {
    @State var email="";
    @State var password="";
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
                    TextField("Email address",text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password",text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button{
                        //Login function
                    } label:{
                        ZStack{
                           RoundedRectangle(
                            cornerRadius: 10
                           ).foregroundColor(Color.blue)
                            Text("Login")
                                .bold()
                                .foregroundColor(Color.white)
                        
                        }
                    }.padding()
                } .offset(y:-50)
                
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
