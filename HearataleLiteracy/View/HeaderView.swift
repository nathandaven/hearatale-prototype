//
//  HeaderView.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/13/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    func loadHeader(_ title: String) {
        self.title.text = title
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        self.contentView.backgroundColor = .white
                
        self.contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
}
