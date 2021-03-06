//
//  FeedViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit
import TwitterKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI


class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let articleCell = "cellID"
    
    let client = TWTRAPIClient()
    
    var articles: [Article] = {
        var drakeGodsPlanArticle = Article()
        drakeGodsPlanArticle.articleTitle = "Drake's 'God's Plan' No. 1 on Billboard Hot 100 for Sixth Week, Post Malone's 'Psycho' Debuts at No. 2"
        drakeGodsPlanArticle.articleImageName = "drake_gods_plan_post_malone"
        
        var drakeHERArticle = Article()
        drakeHERArticle.articleTitle = "Drake and H.E.R. sing a duet in this inventive fan-made “Jungle” remix"
        drakeHERArticle.articleImageName = "drake_her_jungle"
        
        var drakeArticle = Article()
        drakeArticle.articleTitle = "Drake’s New Song “Showin’ Off” Surfaces"
        drakeArticle.articleImageName = "drake_showin_off"
        
        return [drakeArticle, drakeHERArticle, drakeGodsPlanArticle, drakeHERArticle, drakeArticle]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.collectionViewLayout = layout
        collectionView?.register(ArticleCell.self, forCellWithReuseIdentifier: articleCell)
        setupNavbar()
        
        if Auth.auth().currentUser?.uid == nil {
            performSelector(inBackground: #selector(handleLogout), with: nil)
        }
    }
    
    func setupNavbar() {
        navigationItem.title = "Muse"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let login = LoginController()
        navigationController?.present(login, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.articleCell, for: indexPath) as! ArticleCell
        cell.article = articles[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Get 16:9 aspect ratio
        let width = view.frame.width - 16 - 16
        let height = (width) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}










