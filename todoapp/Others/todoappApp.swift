//
//  todoappApp.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import SwiftUI
import FirebaseCore

@main
struct todoappApp: App {
    init(){
        FirebaseApp.configure();
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
