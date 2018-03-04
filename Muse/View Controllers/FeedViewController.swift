//
//  FeedViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit
import SnapKit


class FeedViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    let cell = "cellID"
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return scroll
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.collectionViewLayout = layout
        collection.backgroundColor = UIColor.clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        
        // Pin the scroll view to the whole view
        scrollView.snp.makeConstraints {
            make in
            make.edges.equalTo(view)
        }
        
        collectionView.frame = view.frame
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell)
        
        scrollView.addSubview(collectionView)
        
        
        
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
