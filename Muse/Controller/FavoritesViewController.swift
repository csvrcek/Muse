//
//  FavoritesViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class FavoritesViewController: UITableViewController {
    let cellID = "cellID"
    
    let artists = [
        ["Drake"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavbar()
    }
    
    func setupNavbar() {
        navigationItem.title = "Muse"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.text = "Header"
        return header
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return artists.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        let name = artists[indexPath.section][indexPath.row]
        
        let artistPic = UIImage(named: "drake")
        
        cell?.textLabel?.text = name
        cell?.imageView?.image = artistPic
        
        return cell!
    }
}
