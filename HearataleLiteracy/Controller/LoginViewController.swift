//
//  LoginViewController.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, LoginDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let loginView = LoginView()
        loginView.delegate = self
        self.view = loginView
    }
    
    func pressedLoginButton(_ sender: Any, id: String, password: String) {
        if (id == "12345" && password == "password") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func pressedHelpButton(_ sender: Any) {
        print("HELPED")
    }
}
