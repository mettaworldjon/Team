//
//  SignUpController.swift
//  Team
//
//  Created by Jonathan on 11/26/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Pastel

class SignUpController: UIViewController {
    
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
        backgroundGradient.startAnimation()
        view.addSubview(backgroundGradient)
        NSLayoutConstraint.activate([
            backgroundGradient.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/4),
            backgroundGradient.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundGradient.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundGradient.topAnchor.constraint(equalTo: view.topAnchor)
            ])
    }
}
