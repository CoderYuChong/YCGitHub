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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setupNavBar() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.setBackgroundImage(UIImage(color: navBarbackgroundColor), for: .default)
        navigationBarAppearance.tintColor = themeColor
        let textAttributes = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: navTitleFontSize),
            NSAttributedStringKey.foregroundColor: navBarTitleColor
            ]
        
        navigationBarAppearance.titleTextAttributes = textAttributes

    }
    

}
