//
//  TabBarController.swift
//  Muse
//
//  Created by Connor Svrcek on 3/6/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Feed
        let layout = UICollectionViewFlowLayout()
        let feed = FeedViewController(collectionViewLayout: layout)
        feed.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "icons8-news-50"), tag: 0)
        
        // Favorites
        let faves = FavoritesViewController()
        faves.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "icons8-heart-outline-50"), tag: 1)
        
        // Trending
        let trend = TrendingViewController(collectionViewLayout: layout)
        trend.tabBarItem = UITabBarItem(title: "Trending", image: #imageLiteral(resourceName: "icons8-gas-filled-50"), tag: 2)
        
        let controllers = [feed, faves, trend]
        viewControllers = controllers.map {UINavigationController(rootViewController: $0) }
    }
}
