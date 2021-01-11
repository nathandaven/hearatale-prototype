//
//  Question.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation

public class Question {
    
    public var title: String?
    public var description: String?
    public var answers: [String?]
    
    init(title: String?, description: String?, answers: [String?]) {
        self.title = title
        self.description = description
        self.answers = answers
    }
    
}
