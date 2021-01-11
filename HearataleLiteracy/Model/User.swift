//
//  User.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation
import UIKit

public struct User {
    public static var id: String = ""
    public static var password: String = ""
    
    public static var name: String = ""
    public static var accountImage: UIImage = UIImage()
    
    public static var isLoggedIn: Bool {
        return self.id != ""
    }
}
