//
//  TrendingViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class TrendingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let articleCell = "cellID"
    
    var articles: [Article] = {
        var toryLanezArticle = Article()
        toryLanezArticle.articleTitle = "Tory Lanez Responds to Video of Altercation With Travis Scott: 'That's My Dawg'"
        toryLanezArticle.articleImageName = "tory_lanez"
        
        var southsideArticle = Article()
        southsideArticle.articleTitle = "Southside Threatens Tory Lanez After Travis Scott Incident: 'We Want All the Smoke'"
        southsideArticle.articleImageName = "southside"
        
        var kanyeArticle = Article()
        kanyeArticle.articleTitle = "This Fan-Made Bracket of Kanye West Songs Is Going Viral"
        kanyeArticle.articleImageName = "kanye"
        
        var drakeArticle = Article()
        drakeArticle.articleTitle = "Drake’s New Song “Showin’ Off” Surfaces"
        drakeArticle.articleImageName = "drake_showin_off"
        
        var drakeTwitchArticle = Article()
        drakeTwitchArticle.articleTitle = "Drake and Twitch Streamer Ninja Broke a Record—and the Internet—Playing Fortnite Together"
        drakeTwitchArticle.articleImageName = "drake_twitch"
        
        return [drakeArticle, kanyeArticle, drakeTwitchArticle, toryLanezArticle, southsideArticle]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()

        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.collectionViewLayout = layout
        collectionView?.register(ArticleCell.self, forCellWithReuseIdentifier: articleCell)
        setupNavbar()
    }
    
    func setupNavbar() {
        navigationItem.title = "Muse"
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
        // Getting 16:9 aspect ratio
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
