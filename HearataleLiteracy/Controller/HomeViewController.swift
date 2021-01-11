//
//  HomeViewController.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UITableViewController {
    
    let logoImageView = UIImageView(image: UIImage(named: "PhonicsLogo"))
    
    let lessonLabels: [String] = ["Assigned", "Completed", "Locked"]
    
    let lessons: [String: [Lesson]] = [
        "Assigned": [
            Lesson(name: "PREFIXES", description: "lalala", dueDate: "8/26", grade: 93),
             Lesson(name: "BASIC VERBS", description: "hahahaha", dueDate: "9/04", grade: 80)
        ],
        "Completed": [Lesson(name: "SUFFIXES", description: "lalala", dueDate: "9/11", grade: 93)],
        "Locked": [Lesson(name: "ADVANCED VERBS", description: "lalala", dueDate: "9/18", grade: nil)]
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.view.backgroundColor = .white
        
        tableView.register(LessonCell.self, forCellReuseIdentifier: "LessonCell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
                
        if (!User.isLoggedIn) {
            print("Not Logged In")
            presentLogin()
        } else {
            print("Logged In")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        addNavBarImage()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        logoImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = logoImageView
        navigationItem.leftBarButtonItems = [backButton, helpButton]
        navigationItem.rightBarButtonItems = [accountButton, homeButton]
        
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.backgroundColor = UIColor.init(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0)
        
//        if let navigator = parent?.navigationController as? Navigator {
//            navigator.setTitle(image: logoImage)
//            navigator.add(view: feedbackButton, index: 1)
//            navigator.add(view: userButton)
//        }
    }
    
    func presentLogin() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        
        navigationController?.show(loginVC, sender: self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons[lessonLabels[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell") as! LessonCell
        cell.loadLesson(lessons[lessonLabels[indexPath.section]]?[indexPath.row] ?? Lesson(name: "Error", description: "", dueDate: "", grade: 0))
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        header.loadHeader(lessonLabels[section])
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    lazy var accountButton: UIBarButtonItem = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage.init(systemName: "person"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.tintColor = .black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .white
        
        button.addTarget(self, action: #selector(HomeViewController.logout(_:)), for: .touchUpInside)
        
        return UIBarButtonItem(customView: button)
    }()
    
    lazy var homeButton: UIBarButtonItem = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage.init(systemName: "house"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.tintColor = .black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .white
        
        return UIBarButtonItem(customView: button)
    }()
    
    lazy var backButton: UIBarButtonItem = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.tintColor = .black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .white
        
        return UIBarButtonItem(customView: button)
    }()
    
    lazy var helpButton: UIBarButtonItem = {
        let button = UIButton(type: .roundedRect)
        button.setImage(UIImage.init(systemName: "questionmark"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.tintColor = .black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .white
        
        return UIBarButtonItem(customView: button)
    }()
    
//    lazy var statusBarSize: CGFloat = {
//        guard var offset: CGFloat = parent?.navigationController?.navigationBar.frame.height else { return 0.0 }
//        if #available(iOS 13.0, *) {
//            offset += view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
//        } else {
//            // Fallback on earlier versions
//        }
//
//        offset -= 0.5
//        return offset
//    }()
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        (parent?.navigationItem.titleView as? UIImageView)?.image = logoImage
        //(parent as? HUDViewController)?.showButton()
        
//        if let navigator = parent?.navigationController as? Navigator {
//            navigator.moveAndResize(image: logoImageView)
//            navigator.moveAndResize(image: feedbackButton)
//            navigator.moveAndResize(image: userButton)
//        }
//    }
    
    @objc func logout(_ sender: Any) {
        print("Hello")
        let alert = UIAlertController(title: "Manage Account", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (action) in
            self.presentLogin()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension UIApplication {

    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }

}
