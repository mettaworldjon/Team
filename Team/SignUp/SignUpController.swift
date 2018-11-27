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
    
    let subTitle:UILabel = {
        let text = UILabel()
        text.text = "Provide Correct Credentials for Sign Up"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.numberOfLines = 0
        text.textAlignment = .center
        return text
    }()
    
    let name:CustomTextField = {
        let field = CustomTextField(iconImage: #imageLiteral(resourceName: "avatar"), title: "Full Name", placeholder: "Your Name")
        field.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.heightAnchor.constraint(equalToConstant: 100).isActive = true
        field.textView.returnKeyType = .next
        return field
    }()
    
    
    let email:CustomTextField = {
        let field = CustomTextField(iconImage: #imageLiteral(resourceName: "email"), title: "Email Address", placeholder: "Your Email")
        field.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.heightAnchor.constraint(equalToConstant: 100).isActive = true
        field.textView.returnKeyType = .next
        return field
    }()
    
    let user:CustomTextField = {
        let field = CustomTextField(iconImage: #imageLiteral(resourceName: "man"), title: "User Name", placeholder: "Username")
        field.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.heightAnchor.constraint(equalToConstant: 100).isActive = true
        field.textView.returnKeyType = .next
        return field
    }()
    
    let password:CustomTextField = {
        let field = CustomTextField(iconImage: #imageLiteral(resourceName: "keywords"), title: "Password", placeholder: "Your Password")
        field.textView.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        field.heightAnchor.constraint(equalToConstant: 100).isActive = true
        field.textView.returnKeyType = .continue
        return field
    }()
    var hiddenKeyboard:NSLayoutConstraint?
    var shownKeybaord:NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
    }
    
    func setupNav() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIView())
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController!.navigationBar.barStyle = .blackTranslucent
        self.navigationItem.backBarButtonItem?.tintColor = .white
        self.title = "Sign Up Here"
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
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

        inputBox()
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
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3.5/4),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        hiddenKeyboard = container.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 30)
        hiddenKeyboard?.isActive = true
        shownKeybaord = container.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: -165)
        
        
        let stackView:UIStackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.isUserInteractionEnabled = true
            sv.axis = .vertical
            sv.spacing = -13
            return sv
        }()
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -30),
            stackView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 3.4/4),
            ])
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(user)
        stackView.addArrangedSubview(password)
        name.textView.delegate = self
        email.textView.delegate = self
        user.textView.delegate = self
        password.textView.delegate = self
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalTo: stackView.widthAnchor)
            ])
        
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor("1C66FF")
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 4
        btn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalTo: name.box.heightAnchor, constant: 0),
            btn.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: 0),
            btn.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            btn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -15)
            ])
    }
    
    @objc func handleSignUp() {
        self.title = ""
        let signIn = SignInController()
        signIn.ref = self
        self.navigationController?.pushViewController(signIn, animated: true)
    }
    
    
    
    
}

extension SignUpController:UITextFieldDelegate {
    
    @objc func handleDismiss() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case name.textView:
            name.textView.resignFirstResponder()
            email.textView.becomeFirstResponder()
        case email.textView:
            email.textView.resignFirstResponder()
            user.textView.becomeFirstResponder()
        case user.textView:
            user.textView.resignFirstResponder()
            password.textView.becomeFirstResponder()
        default:break
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case user.textView, password.textView:
            show()
        default: break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        hide()
        self.view.endEditing(true)
    }
    
    fileprivate func show() {
        UIView.animate(withDuration: 0.3) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.clear]
            self.hiddenKeyboard?.isActive = false
            self.shownKeybaord?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func hide() {
        UIView.animate(withDuration: 0.3) {
            self.shownKeybaord?.isActive = false
            self.hiddenKeyboard?.isActive = true
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            self.view.layoutIfNeeded()
        }
    }
}
