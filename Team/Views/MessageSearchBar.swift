//
//  MessageSearchBar.swift
//  Team
//
//  Created by Jonathan on 11/27/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class SearchBar: UIView {
    
    let searchField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Search...", attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor(hexString: "4A4A4A")])
        return tf
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = UIColor(hexString: "F2F6FF")
        let box = UIView()
        box.backgroundColor = .white
        box.translatesAutoresizingMaskIntoConstraints = false
        box.layer.cornerRadius = 4
        self.addSubview(box)
        NSLayoutConstraint.activate([
            box.heightAnchor.constraint(equalToConstant: 45),
            box.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            box.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            box.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
            ])
        self.addSubview(searchField)
        NSLayoutConstraint.activate([
            searchField.centerYAnchor.constraint(equalTo: box.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 13),
            searchField.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: -13)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
