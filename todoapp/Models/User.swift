//
//  User.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation
struct User: Codable{
    let id: String;
    let name: String;
    let email: String;
    let joined: TimeInterval;
}
