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
        setupNavBar()
        //    [UINavigationBar appearance].tintColor = [UIColor blackColor];
        //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        //    CGSize navBarSize = CGSizeMake(kScreenWidth, 64);
        //    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:kAppTintColor andSize:navBarSize] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        //    [self.navigationBar setTitleTextAttributes:@{
        //                                                 NSForegroundColorAttributeName : [UIColor blackColor],
        //                                                 NSFontAttributeName : [UIFont fontWithName:@"Helvetica Neue" size:15.f]
        //                                                 }];
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setupNavBar() {
        UINavigationBar.appearance().tintColor = .black
    
    }
    

}
