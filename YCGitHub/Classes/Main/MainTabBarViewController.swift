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
        // Do any additional setup after loading the view.
    }


}

extension MainTabBarViewController {
   fileprivate func setupViewControllers() {
        
        let repositories = R.storyboard.repositories().instantiateInitialViewController();
        let trendingVC = R.storyboard.trending().instantiateInitialViewController();
        trendingVC?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Trending", image: R.image.tabbar_trending_normal(), selectedImage: R.image.tabbar_profile_selected())
        repositories?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Profile", image: R.image.tabbar_profile_normal(), selectedImage: R.image.tabbar_profile_selected())
        
        self.viewControllers = [trendingVC!, repositories!];
    }
}



