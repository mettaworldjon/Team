//
//  CustomTextField.swift
//  Team
//
//  Created by Jonathan on 11/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class CustomTextField: UIView {
    
    let iconView:UIImageView = {
        let icon = UIImageView(image: #imageLiteral(resourceName: "Icon"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let textTitle:UILabel = {
        let text = UILabel()
        text.text = "Full Name"
        text.font = .systemFont(ofSize: 11, weight: .semibold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let box:UIView = {
        let box = UIView()
        box.backgroundColor = UIColor(hexString: "F4F6FF")
        box.translatesAutoresizingMaskIntoConstraints = false
        box.layer.cornerRadius = 2
        return box
    }()
    
    let textView:UITextField = {
        let text = UITextField()
        text.placeholder = "Your Real Name"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.attributedPlaceholder = NSAttributedString(string: "Your Real Name", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)])
        return text
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(iconImage:UIImage, title:String, placeholder:String) {
        self.init(frame: .zero)
        iconView.image = iconImage
        self.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            iconView.widthAnchor.constraint(equalToConstant: 12),
            iconView.heightAnchor.constraint(equalToConstant: 12)
            ])
        
        textTitle.text = title
        self.addSubview(textTitle)
        NSLayoutConstraint.activate([
            textTitle.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 5),
            textTitle.centerYAnchor.constraint(equalTo: iconView.centerYAnchor, constant: 1)
            ])
        
        self.addSubview(box)
        NSLayoutConstraint.activate([
            box.leadingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: 0),
            box.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 5),
            box.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0),
            box.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        textView.placeholder = placeholder
        self.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 15),
            textView.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: -15),
            textView.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0),
            textView.heightAnchor.constraint(equalTo: box.heightAnchor),
            ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
