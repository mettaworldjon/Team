//
//  NavGradients.swift
//  Team
//
//  Created by Jonathan on 11/27/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Pastel

extension UIViewController {
    func setGradientNav(title:String, colors:[UIColor]) {
        self.title = title
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIView())
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController!.navigationBar.barStyle = .blackTranslucent
        self.navigationItem.backBarButtonItem?.tintColor = .white
        let backgroundGradient:PastelView = {
            let view = PastelView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.startPastelPoint = .left
            view.endPastelPoint = .right
            view.animationDuration = 2
            view.setColors(colors)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        backgroundGradient.startAnimation()
        self.navigationController?.navigationBar.addSubview(backgroundGradient)
        self.navigationController?.navigationBar.sendSubviewToBack(backgroundGradient)
        NSLayoutConstraint.activate([
            backgroundGradient.topAnchor.constraint(equalTo: self.navigationController!.navigationBar.topAnchor, constant: -44),
            backgroundGradient.leadingAnchor.constraint(equalTo: self.navigationController!.navigationBar.leadingAnchor),
            backgroundGradient.heightAnchor.constraint(equalToConstant: 88),
            backgroundGradient.widthAnchor.constraint(equalTo: self.navigationController!.navigationBar.widthAnchor)
            ])
    }
}
