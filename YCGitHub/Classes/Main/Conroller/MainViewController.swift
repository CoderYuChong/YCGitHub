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
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.icon_nav_back(), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(backToPrevious))
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func backToPrevious() {
        self.popViewController(animated: true)
    }
}
