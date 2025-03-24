//
//  CustomButton.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct CustomButton: View {
    let title: String;
    let background: Color;
    let action: () -> Void;
    var body: some View {
        Button{
            //action function
            action()
        } label:{
            ZStack{
               RoundedRectangle(
                cornerRadius: 10
               ).foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            
            }
        }.padding()
    }
}

#Preview {
    CustomButton(
        title: "Title", background: .blue
    ){
        //Action
       
    }
}
