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
    
    var artists: [Favorite]  = {
        let drake = Favorite()
        drake.name = "Drake"
        drake.imageName = "drake"
        
        let travis = Favorite()
        travis.name = "Travis Scott"
        travis.imageName = "travis"
        
        return [drake, travis]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: #selector(handleInsert))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavbar()
    }
    
    // TODO: implement insert feature
    @objc func handleInsert() {
        print("Inserted")
    }
    
    func setupNavbar() {
        navigationItem.title = "Muse"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            artists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = artists[sourceIndexPath.row]
        artists.remove(at: sourceIndexPath.row)
        artists.insert(movedObject, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        let artist = artists[indexPath.row]
        
        cell?.textLabel?.text = artist.name
        cell?.imageView?.image = UIImage(named: artist.imageName!)
        
        return cell!
    }
}
