//
//  MainTabBarViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class MainTabBarViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.tabBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }


}

extension MainTabBarViewController {
   fileprivate func setupViewControllers() {
        
        let newsVC = R.storyboard.news().instantiateInitialViewController()
        let searchVC = R.storyboard.search().instantiateInitialViewController()
        let trendingVC = R.storyboard.trending().instantiateInitialViewController()
        let profileVC = R.storyboard.profile().instantiateInitialViewController()

        trendingVC?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Trending", image: R.image.tabbar_trending_normal(), selectedImage: R.image.tabbar_trending_selected())
        newsVC?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "News", image: R.image.tabbar_news_normal(), selectedImage: R.image.tabbar_news_selected())
        searchVC?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Search", image: R.image.tabbar_search_normal(), selectedImage: R.image.tabbar_search_selected())
        profileVC?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Profile", image: R.image.tabbar_profile_normal(), selectedImage: R.image.tabbar_profile_selected())
        self.viewControllers = [trendingVC!, newsVC!, searchVC!, profileVC!]
    }
}



