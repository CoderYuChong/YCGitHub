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
    lazy var repositoriesList: [TrendingRepositoriesModel] = [TrendingRepositoriesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100;
        tableView.register(R.nib.repositoriesTableViewCell)
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
//        tableView.footerRefresh(target: self, refreshingAction: #selector(loadData), automaticallyRefresh: true, triggerAutomaticallyRefreshPercent: 30)
        
    }
}

// MARK: Network
extension RepositoriesTrendingViewController: NetworkAgent {
    @objc func loadData() {
        let trendingRequest = TrendingRepositoriesRequest()
        request(trendingRequest) { (response, _) in
            self.tableView.endHeaderRefreshing()
            if let response = response {
                let trending = response as TrendingRepositoriesList
                self.repositoriesList = trending.items
                self.tableView.reloadData()
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
        return self.repositoriesList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.repositoriesTableViewCell, for: indexPath)!
        cell.repositoriesModel = repositoriesList[indexPath.row]
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let languageName: String = LanguageScreeningDataTool.getLanguage(.repositories)
        let languageSince: String = LanguageScreeningDataTool.getTime(.repositories)
        let trendingView = R.nib.trendingHeaderView.firstView(owner: self)
        trendingView?.trendingString = languageName + " | " + languageSince
        return trendingView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
}








