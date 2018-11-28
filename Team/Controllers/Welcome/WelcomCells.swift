//
//  WelcomCells.swift
//  Team
//
//  Created by Jonathan on 11/25/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class WelcomeCell: UICollectionViewCell {
    
    var pageData:WelcomePage? {
        didSet {
            mainImage.image = pageData?.image
            mainTitle.text = pageData?.mainTitle
            subTitle.text = pageData?.subTitle
        }
    }
    
    
    let mainImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "image1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let mainTitle:UILabel = {
        let title = UILabel()
        title.text = "Team Is Power For An Organization"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        title.textAlignment = .center
        title.textColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    let subTitle:UILabel = {
        let title = UILabel()
        title.text = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi and topic hopefully going."
        title.textColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 12, weight: .regular)
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.addSubview(mainImage)
        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            mainImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            mainImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.8/4),
            mainImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            mainImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35)
            ])
        
        self.addSubview(mainTitle)
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            mainTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            mainTitle.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 0),
            mainTitle.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 0)
            ])
        
        self.addSubview(subTitle)
        NSLayoutConstraint.activate([
            subTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: mainTitle.leadingAnchor, constant: -4),
            subTitle.trailingAnchor.constraint(equalTo: mainTitle.trailingAnchor, constant: 4)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
