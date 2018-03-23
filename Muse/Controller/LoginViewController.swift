//
//  LoginControllerViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 3/19/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController  {
    
    let inputsContainerView: UIView = {
        let contView = UIView()
        contView.backgroundColor = UIColor.white
        contView.translatesAutoresizingMaskIntoConstraints = false
        contView.layer.cornerRadius = 5
        contView.layer.masksToBounds = true
        contView.layer.borderWidth = 1
        contView.layer.borderColor = UIColor.black.cgColor
        return contView
    }()
    
    let loginRegisterButton: UIButton = {
        let login = UIButton(type: .system)
        login.layer.borderWidth = 1
        login.backgroundColor = UIColor.white
        login.setTitle("Register", for: .normal)
        login.setTitleColor(UIColor.black, for: .normal)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.cornerRadius = 5
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        login.layer.masksToBounds = true
        return login
    }()
    
    let nameTextField: UITextField = {
        let name = UITextField()
        name.placeholder = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.autocorrectionType = .no
        return name
    }()
    
    let nameSeparator: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        sep.translatesAutoresizingMaskIntoConstraints = false
        return sep
    }()
    
    let emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.autocapitalizationType = .none
        email.spellCheckingType = .no
        return email
    }()
    
    let emailSeparator: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(displayP3Red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        sep.translatesAutoresizingMaskIntoConstraints = false
        return sep
    }()
    
    let passwordField: UITextField = {
        let pass = UITextField()
        pass.placeholder = "Password"
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.isSecureTextEntry = true
        return pass
    }()
    
    let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "Muse")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(logoImageView)
        setUpInputsContainerView()
        setUpLoginRegisterButton()
        setUpLogo()
    }
    
    func setUpLogo() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setUpInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparator)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparator)
        inputsContainerView.addSubview(passwordField)
        
        
        // Name text field
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        // Name separator
        nameSeparator.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparator.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Email text field
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSeparator.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        // Email separator
        emailSeparator.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparator.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Password text field
        passwordField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailSeparator.bottomAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
    }
    
    func setUpLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}




