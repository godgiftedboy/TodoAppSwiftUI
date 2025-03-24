//
//  HeaderView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.pink)
                .rotationEffect( Angle(degrees: 15))
                
            VStack{
                Text("Todo List")
                    .font(.system(size: 50))
                    .bold()
                Text("Getting Things done")
                    .font(.system(size: 30))
                    
            }.foregroundColor(Color.white)
        }
        .frame(width: UIScreen.main.bounds.width*3,
               height: 300)
        .offset(y:-100)
    }
}

#Preview {
    HeaderView()
}
