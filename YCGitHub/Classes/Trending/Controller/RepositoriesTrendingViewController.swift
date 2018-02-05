//
//  RepositoriesTrendingViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit
import MJRefresh

class RepositoriesTrendingViewController: UITableViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "Repositories"
    var languageName: String = UserDefaults.LanguageScreeningRepositories.string(forkey: .language)
    var languageSince: String = UserDefaults.LanguageScreeningRepositories.string(forkey: .since)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .orange
//        view.translatesAutoresizingMaskIntoConstraints = false
        setupRefresh()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        printLog("----indicatorInfo------")
        return itemInfo
    }
    

}

// MARK: UI
extension RepositoriesTrendingViewController {
    fileprivate func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: true)
        tableView.footerRefresh(target: self, refreshingAction: #selector(loadData), automaticallyRefresh: true, triggerAutomaticallyRefreshPercent: 30)
        
    }
}

// MARK: Network
extension RepositoriesTrendingViewController: NetworkAgent {
    @objc func loadData() {
        let trendingRequest =  TrendingRequest(lang: languageName, timeType: since(rawValue: languageSince)!)
        request(trendingRequest) { (response) in
            if let response = response {
                let trending = response as TrendingList
                guard let items = trending.items else {
                    return
                }
              
                
            }
        }
    }
    
    func refreshData() {
        tableView.mj_header.beginRefreshing()
    }
}

// MARK: delegate-datasource
extension RepositoriesTrendingViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "dtr"
        let cell = UITableViewCell(style: .default, reuseIdentifier: ID)
        cell.textLabel?.text = "这是第" + String(indexPath.row) + "行"
        return cell;
    }
}








