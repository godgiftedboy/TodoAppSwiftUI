//
//  ContentView.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //signed in
            
            
            TabView{
                TodoListView()
                    .tabItem{
                        Label("Home",systemImage: "house")
                    }
                _ProfileView()
                    .tabItem{
                        Label("Profile",systemImage: "person.circle")
                    }
                
            }
            
        }else{
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
