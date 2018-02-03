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
        repositories?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tabbar_me_normal"), selectedImage: UIImage(named: "tabbar_me_selected"))
        trendingVC?.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Find", image: UIImage(named: "tabbar_home_selected"), selectedImage: UIImage(named: "tabbar_home_normal"))
        
        self.viewControllers = [trendingVC!, repositories!];
    }
}



