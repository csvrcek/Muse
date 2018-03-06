//
//  FavoritesViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
    
    func setupNavbar() {
        navigationItem.title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}


// Create a custom UITableView class for the artist/genre list
// Then add it as a subview to the ViewController above
// https://www.youtube.com/watch?v=H9NhYx9xIiU


