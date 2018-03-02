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
    lazy var develpoerList: [TrendingDevelpoerModel] = [TrendingDevelpoerModel]()

    
    var languageName: String = LanguageScreeningDataTool.getLanguage(.developer)
    var languageSince: String = LanguageScreeningDataTool.getTime(.developer)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 72
        tableView.register(R.nib.develpoerTableViewCell)
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
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: true)
//        tableView.footerRefresh(target: self, refreshingAction: #selector(loadData), automaticallyRefresh: true, triggerAutomaticallyRefreshPercent: 30)
        
    }
}

// MARK: target-action
extension DevelpoerTrendingViewController: NetworkAgent {
    @objc func loadData() {
        let trendingRequest = TrendingDevelpoerRequest()
        request(trendingRequest) { (response, _) in
            self.tableView.endHeaderRefreshing()
            if let response = response {
                let trending = response as TrendingDevelpoerList
                self.develpoerList = trending.items
                self.tableView.reloadData()
            }
        }
    }
    
    func refreshData() {
        tableView.beginRefreshing()
    }
}

// MARK: delegate-datasource
extension DevelpoerTrendingViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return develpoerList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.develpoerTableViewCell, for: indexPath)!
        cell.develpoerModel = develpoerList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let trendingView = R.nib.trendingHeaderView.firstView(owner: self)
        trendingView?.trendingString = languageName + " | " + languageSince
        return trendingView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let develop = develpoerList[indexPath.row]
        let profileVC = R.storyboard.profile.profileViewController()!
        profileVC.userName = develop.user
        profileVC.profileViewType = .others
        profileVC.title = develop.user
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
}
