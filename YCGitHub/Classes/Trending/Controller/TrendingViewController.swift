//
//  TrendingControllerViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TrendingViewController: TwitterPagerTabStripViewController {
//    override var settings: TwitterPagerTabStripSettings 
    override func viewDidLoad() {
        settings.style.titleColor = .black
        settings.style.selectedDotColor = .blue;
        settings.style.dotColor = .lightGray;
        
        super.viewDidLoad()

        loadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let repositories = RepositoriesTrendingViewController()
        let develpoer = DevelpoerTrendingViewController();
        return [repositories,develpoer]
    }
    
}

extension TrendingViewController: NetworkAgent {
   fileprivate func loadData() {
    let trendingRequest =  TrendingRequest(lang: "java", timeType: .daily)
    request(trendingRequest) { (response) in
        if let response = response {
            let trending = response as TrendingList
            guard let items = trending.items else {
                return
            }
            for item in items {
                print(item.repo_link ?? "iiiiiiii")
            }
            print("------")
        }
    }
    }

}
