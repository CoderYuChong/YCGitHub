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

class RepositoriesTrendingViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "Repositories"
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .plain)
            
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
//        view.translatesAutoresizingMaskIntoConstraints = false
        // Do any additional setup after loading the view.
        setupUI()
        setupRefresh()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    

}

/// MARK: UI
extension RepositoriesTrendingViewController {
   fileprivate func setupUI() {
        view .addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
             make.edges.equalTo(self.view)
        }
    }
    
    fileprivate func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: false)
        tableView.bottomRefresh(target: self, refreshingAction: #selector(loadData), automaticallyRefresh: true, triggerAutomaticallyRefreshPercent: 30)
        
    }
}
/// MARK: target-action
extension RepositoriesTrendingViewController {
    @objc func loadData() {
        printLog("--------")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
        }
        
    }
}



extension RepositoriesTrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "dtr"
        let cell = UITableViewCell(style: .default, reuseIdentifier: ID)
        cell.textLabel?.text = "这是第" + String(indexPath.row) + "行"
        return cell;
    }
}









