//
//  DevelpoerTrendingViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import XLPagerTabStrip
    
class DevelpoerTrendingViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "Develpoer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple;
        
        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
}
