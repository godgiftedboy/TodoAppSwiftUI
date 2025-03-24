//
//  RegisterView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct RegisterView: View {
    @State var name="";
    @State var email="";
    @State var password="";
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
                TextField("Full name",text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email address",text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password",text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
            }.offset(y:-50)
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
