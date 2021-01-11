//
//  Database.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation

public struct Database {
    
    let testUser = ["id": "12345", "name": "Andrew Jeffers"]
    
    public func getTestUser() -> [String: String] {
        return testUser
    }
    
}
