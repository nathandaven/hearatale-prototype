//
//  LessonCell.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/10/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import Foundation
import UIKit

class LessonCell: UITableViewCell {
    
//    var lesson: Lesson? {
//        didSet {
//            self.
//        }
//    }
    
    func loadLesson(_ lesson: Lesson) {
        titleLabel.text = lesson.name
        dueLabel.text = lesson.dueDate.description
        gradeLabel.text =  String(lesson.grade ?? 0)
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gradeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.layer.masksToBounds = false
        
        self.contentView.backgroundColor = .white
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 2
        
        // Cell shadow section
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 7.0
        self.layer.shadowOpacity = 0.7
        
        let gradeContainerView = UIView(frame: CGRect(x: 100, y: 20, width: 20, height: 20))
        gradeContainerView.layer.backgroundColor = UIColor.green.cgColor
        gradeContainerView.layer.cornerRadius = 15
        gradeContainerView.layer.masksToBounds = true
        gradeContainerView.translatesAutoresizingMaskIntoConstraints =  false
        
        gradeContainerView.addSubview(gradeLabel)
        
        addSubview(titleLabel)
        addSubview(dueLabel)
        addSubview(gradeContainerView)
        
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        dueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0).isActive = true
        dueLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        gradeContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        gradeContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
