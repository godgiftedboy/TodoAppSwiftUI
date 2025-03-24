//
//  RegisterView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel();
    var body: some View {
        VStack{
            
            //Header View
            HeaderView(
                title: "Register",
                subTitle: "Start Organizing todos",
                angle: -15,
                background: .orange
            )
            Form{
                TextField("Full name",text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email address",text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                CustomButton(title: "Register", background: .green){
                    //Register Action
                    viewModel.register()
                }
            }.offset(y:-50)
            
            
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
