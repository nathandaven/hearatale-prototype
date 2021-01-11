//
//  Lesson.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation

public class Lesson {
    
    public var name: String
    public var description: String
    public var dueDate: String
//    //0 = Assigned, 1 = Completed, 2 = Locked
//    //Change this to an enum later probably
//    public var status: Int
    
    public var grade: Double?
    
    init(name: String, description: String, dueDate: String, grade: Double?) {
        
        self.name = name
        self.description = description
        self.dueDate = dueDate
        self.grade = grade
    }
    
}
