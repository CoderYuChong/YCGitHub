//
//  MainViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationBar.backIndicatorImage = R.image.icon_nav_back()
//        self.navigationBar.backIndicatorTransitionMaskImage = R.image.icon_nav_back()
//        let backItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = backItem
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
