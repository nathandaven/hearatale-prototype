//
//  LoginDelegate.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation

protocol LoginDelegate {
    func pressedLoginButton(_ sender: Any, id: String, password: String)
    
    func pressedHelpButton(_ sender: Any)
}
