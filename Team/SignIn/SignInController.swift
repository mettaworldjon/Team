//
//  SignInController.swift
//  Team
//
//  Created by Jonathan on 11/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Pastel

class SignInController: UIViewController {
    
    var ref:UIViewController?
    
    let subTitle:UILabel = {
        let text = UILabel()
        text.text = "Log In Here With Your User Name And Password"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.numberOfLines = 0
        text.textAlignment = .center
        return text
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
    }
    
    func setupNav() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController!.navigationBar.barStyle = .blackTranslucent
        self.navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIView())
        self.navigationItem.backBarButtonItem?.tintColor = .white
        self.title = "Log In Here"
    }
    
    func setupUI() {
        view.backgroundColor = .white
        let backgroundGradient:PastelView = {
            let view = PastelView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.startPastelPoint = .left
            view.endPastelPoint = .right
            view.animationDuration = 2
            view.setColors([UIColor("1C66FF"),UIColor("4D87FF")])
            return view
        }()
        backgroundGradient.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        backgroundGradient.startAnimation()
        view.addSubview(backgroundGradient)
        NSLayoutConstraint.activate([
            backgroundGradient.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/4),
            backgroundGradient.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundGradient.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundGradient.topAnchor.constraint(equalTo: view.topAnchor)
            ])
        
        view.addSubview(subTitle)
        NSLayoutConstraint.activate([
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            subTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2.3/4)
            ])
    }
    
    func inputBox() {
        let container:UIView = {
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.backgroundColor = .white
            container.layer.shadowColor = UIColor.lightGray.cgColor
            container.layer.shouldRasterize = true
            container.layer.shadowOpacity = 1
            container.layer.shadowOffset = CGSize.zero
            container.layer.shadowRadius = 2
            container.layer.borderColor = UIColor.white.cgColor
            container.layer.cornerRadius = 4
            return container
        }()
        view.addSubview(container)
        container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2.8/4),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2.5/4),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
    }
    
    func handleDelegation() {
        
    }
    
}

extension SignInController {
    
    @objc func handleDismiss() {
        self.view.endEditing(true)
    }
    
    
}
