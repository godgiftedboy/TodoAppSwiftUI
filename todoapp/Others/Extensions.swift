//
//  Extensions.swift
//  todoapp
//
//  Created by Waterflow Technology on 24/03/2025.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String : Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}


// Converts any Encodable type into [String: Any]
// Uses JSONEncoder for encoding
// Uses JSONSerialization to convert Data into a dictionary
// Handles failures gracefully by returning [:]
// Useful for APIs, Firestore, or database interactions
