//
//  DevelpoerTrendingViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import XLPagerTabStrip
    
class DevelpoerTrendingViewController: UITableViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "Develpoers"
    
    var languageName: String = UserDefaults.LanguageScreeningDeveloper.string(forkey: .language)
    var languageSince: String = UserDefaults.LanguageScreeningDeveloper.string(forkey: .since)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .purple;
        setupRefresh()
        
        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
}

// MARK: UI
extension DevelpoerTrendingViewController {
    
    fileprivate func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: false)
        tableView.footerRefresh(target: self, refreshingAction: #selector(loadData), automaticallyRefresh: true, triggerAutomaticallyRefreshPercent: 30)
        
    }
}

// MARK: target-action
extension DevelpoerTrendingViewController {
    @objc func loadData() {
        printLog("--------")
        tableView.mj_header.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
        }
        
    }
    
    func refreshData() {
        
    }
}

// MARK: delegate-datasource
extension DevelpoerTrendingViewController {
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
