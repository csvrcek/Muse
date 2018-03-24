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
        login.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return login
    }()
    
    @objc func handleRegister() {
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordField.text else {
            print("Form is not valid")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            // Successfully authenticated user
            let ref = Database.database().reference(fromURL: "https://muse-63134.firebaseio.com/")
            let usersRef = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    print(err as Any)
                    return
                }
                
                // Successfully added user to database
            })
        }
    }
    
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
    
    lazy var loginRegisterControl: UISegmentedControl = {
        let loginRegister = UISegmentedControl(items: ["Login", "Register"])
        loginRegister.translatesAutoresizingMaskIntoConstraints = false
        loginRegister.tintColor = UIColor.black
        loginRegister.selectedSegmentIndex = 1
        loginRegister.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return loginRegister
    }()
    
    @objc func handleLoginRegisterChange() {
        let title = loginRegisterControl.titleForSegment(at: loginRegisterControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        // Change height of inputContainerView
        inputsContainerViewHeightAnchor?.constant = loginRegisterControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // Get rid of the "Name" field
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(logoImageView)
        view.addSubview(loginRegisterControl)
        
        setUpInputsContainerView()
        setUpLoginRegisterButton()
        setUpLogo()
        setUpLoginRegister()
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setUpLogo() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: loginRegisterControl.topAnchor, constant: -12).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setUpLoginRegister() {
        loginRegisterControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setUpInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor?.isActive = true
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparator)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparator)
        inputsContainerView.addSubview(passwordField)
        
        
        // Name text field
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        // Name separator
        nameSeparator.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparator.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Email text field
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameSeparator.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        // Email separator
        emailSeparator.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparator.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Password text field
        passwordField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailSeparator.bottomAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        passwordTextFieldHeightAnchor = passwordField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    func setUpLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}




