//
//  HeaderView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String;
    let subTitle: String;
    let angle: Double;
    let background: Color;
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
                .rotationEffect( Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    
            }.foregroundColor(Color.white)
                .padding(.top,80)
        }
        .frame(width: UIScreen.main.bounds.width*3,
               height: 350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "subtitle", angle: 15, background: .blue)
}
