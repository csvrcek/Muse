//
//  FeedViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cell = "cellID"
    
    var articles: [Article] = {
        var drakeGodsPlanArticle = Article()
        drakeGodsPlanArticle.articleTitle = "Drake's 'God's Plan' No. 1 on Billboard Hot 100 for Sixth Week, Post Malone's 'Psycho' Debuts at No. 2"
        drakeGodsPlanArticle.articleImageName = "drake_gods_plan_post_malone"
        
        var drakeHERArticle = Article()
        drakeHERArticle.articleTitle = "Drake and H.E.R. sing a duet in this inventive fan-made “Jungle” remix"
        drakeHERArticle.articleImageName = "drake_her_jungle"
        
        
        return [drakeGodsPlanArticle, drakeHERArticle, drakeGodsPlanArticle, drakeHERArticle, drakeGodsPlanArticle]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.collectionViewLayout = layout
        collectionView?.register(ArticleCell.self, forCellWithReuseIdentifier: cell)
        setupNavbar()
    }
    
    func setupNavbar() {
        navigationItem.title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! ArticleCell
        cell.article = articles[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Getting 16:9 aspect ratio
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}










