//
//  TrendingViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
