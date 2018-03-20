//
//  LoginControllerViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 3/19/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import GoogleSignIn

class LoginController: UIViewController, GIDSignInUIDelegate, FUIAuthDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGoogleButton()
    }
    
    fileprivate func setupGoogleButton() {
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 75)
        
        view.addSubview(googleButton)
        
        // Google SignIn
        GIDSignIn.sharedInstance().uiDelegate = self

    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
}
