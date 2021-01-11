//
//  LoginView.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIView, UITextFieldDelegate {
    
    var delegate: LoginDelegate!
    
    let idField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: " Student ID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.allowsEditingTextAttributes = true
        textField.borderStyle = .line
        textField.font = UIFont.boldSystemFont(ofSize: 20.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.allowsEditingTextAttributes = true
        textField.borderStyle = .line
        textField.font = UIFont.boldSystemFont(ofSize: 20.0)
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(red: 0.2, green: 0.5, blue: 0.2, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let helpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Need Help?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(helpButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        
        idField.delegate = self
        passwordField.delegate = self
        
        logoImageView.image = UIImage(named: "PhonicsLogo")
        
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.backgroundColor = UIColor.init(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0).cgColor
        self.layer.masksToBounds = false
        
        addSubview(logoImageView)
        addSubview(idField)
        addSubview(passwordField)
        addSubview(loginButton)
        addSubview(helpButton)
        
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30.0).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: idField.topAnchor, constant: -50.0).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30.0).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30.0).isActive = true
        
        idField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -30.0).isActive = true
        idField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.0).isActive = true
        idField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.0).isActive = true
        idField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        passwordField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30.0).isActive = true
        passwordField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.0).isActive = true
        passwordField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.0).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        loginButton.bottomAnchor.constraint(equalTo: helpButton.topAnchor, constant: -20.0).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        helpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30.0).isActive = true
        helpButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor).isActive = true
        helpButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    @objc func loginButtonPressed(_ sender: Any) {
        delegate.pressedLoginButton(sender, id: idField.text ?? "", password: passwordField.text ?? "")
    }
    
    @objc func helpButtonPressed(_ sender: Any) {
        delegate.pressedHelpButton(sender)
    }
    
     /*
      * Called when 'return' key pressed. return NO to ignore.
      */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }

     /*
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
