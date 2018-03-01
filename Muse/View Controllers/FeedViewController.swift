//
//  FeedViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    let cell = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collectionView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell)
        view.addSubview(collectionView)
        setupNavbar()
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
}
