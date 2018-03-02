//
//  SearchViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/28.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class SearchViewController: SegmentedControlController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = SearchUserViewController()
        let vc2 = SearchRespositoriesViewController()
        self.viewControllers = [vc2, vc1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
