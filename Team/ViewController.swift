//
//  ViewController.swift
//  Team
//
//  Created by Jonathan on 11/25/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Pastel

class ViewController: UIViewController {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }


    func setupUI() {
        setupNav()
        setupNavControls()
        view.backgroundColor = .white
        view.addSubview(mainImage)
        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            mainImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.8/4),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
            ])
        
        view.addSubview(mainTitle)
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            mainTitle.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 0),
            mainTitle.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 0)
            ])
        
        view.addSubview(subTitle)
        NSLayoutConstraint.activate([
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: mainTitle.leadingAnchor, constant: -4),
            subTitle.trailingAnchor.constraint(equalTo: mainTitle.trailingAnchor, constant: 4)
            ])
    }
    
    func setupNav() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupNavControls() {
        let navContainer:PastelView = {
            let container = PastelView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.startPastelPoint = .left
            container.endPastelPoint = .right
            container.animationDuration = 2
            container.setColors([UIColor("1C66FF"),UIColor("4D87FF")])
            return container
        }()
        navContainer.startAnimation()
        view.addSubview(navContainer)
        NSLayoutConstraint.activate([
            navContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            navContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4/4)
            ])
        
        let skipBtn:UIButton = {
            let text = UIButton(type: .system)
            text.setTitle("Skip", for: .normal)
            text.setTitleColor(.white, for: .normal)
            text.titleLabel?.font = .systemFont(ofSize: 13)
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        navContainer.addSubview(skipBtn)
        NSLayoutConstraint.activate([
            skipBtn.centerYAnchor.constraint(equalTo: navContainer.centerYAnchor, constant: -10),
            skipBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            ])
        
        let nextBtn:UIButton = {
            let text = UIButton(type: .system)
            text.setTitle("Next", for: .normal)
            text.setTitleColor(.white, for: .normal)
            text.titleLabel?.font = .systemFont(ofSize: 13)
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        navContainer.addSubview(nextBtn)
        NSLayoutConstraint.activate([
            nextBtn.centerYAnchor.constraint(equalTo: skipBtn.centerYAnchor),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
            ])
        
        let pageNav:UIPageControl = {
            let nav = UIPageControl()
            nav.translatesAutoresizingMaskIntoConstraints = false
            nav.numberOfPages = 3
            nav.currentPage = 2
            return nav
        }()
        
        navContainer.addSubview(pageNav)
        NSLayoutConstraint.activate([
            pageNav.centerYAnchor.constraint(equalTo: nextBtn.centerYAnchor, constant: 0),
            pageNav.centerXAnchor.constraint(equalTo: navContainer.centerXAnchor),
            pageNav.heightAnchor.constraint(equalToConstant: 16),
            pageNav.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
}

