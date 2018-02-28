//
//  ViewController.swift
//  Muse
//
//  Created by Connor Svrcek on 2/28/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the tab bar and viewcontrollers inside
        
        // Feed
        let feed = FeedViewController()
        let navigationFeed = UINavigationController(rootViewController: feed)
        navigationFeed.title = "Feed"
        navigationFeed.tabBarItem.image = #imageLiteral(resourceName: "icons8-news-50")
        
        // Favorites
        let faves = FavoritesViewController()
        let navigationFaves = UINavigationController(rootViewController: faves)
        navigationFaves.title = "Favorites"
        navigationFaves.tabBarItem.image = #imageLiteral(resourceName: "icons8-heart-outline-50")
        
        // Trending
        let trend = TrendingViewController()
        let navigationTrend = UINavigationController(rootViewController: trend)
        navigationTrend.title = "Trending"
        navigationTrend.tabBarItem.image = #imageLiteral(resourceName: "icons8-gas-filled-50")
        
        viewControllers = [navigationFeed, navigationFaves, navigationTrend]
        
    }

   


}

