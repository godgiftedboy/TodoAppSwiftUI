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
