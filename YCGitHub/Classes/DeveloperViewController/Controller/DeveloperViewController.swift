//
//  DeveloperViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/27.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class DeveloperViewController: UITableViewController {

    var developerPath: String!
    var page: Int = 1
    lazy var developerRequest: DeveloperRequest = DeveloperRequest(developerPath)
    lazy var developerList: [DeveloperModel] = [DeveloperModel]()
    lazy var dataSource: DeveloperTableViewDataSource = DeveloperTableViewDataSource(dataSource: [], owner: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefresh()
    }
    
    private func setupTableView() {
        self.tableView = UITableView(frame: CGRect.zero, style: .grouped)
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.rowHeight = 80
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedRowHeight = 80
        tableView.register(R.nib.develpoerTableViewCell)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
}


// MARK: UI
extension DeveloperViewController {
    fileprivate func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: true)
        tableView.footerRefresh(target: self, refreshingAction: #selector(loadMoreData), automaticallyRefresh: false, triggerAutomaticallyRefreshPercent: 30)
        
    }
}

// MARK: Network
extension DeveloperViewController: NetworkAgent {
    @objc func loadData() {
        page = 1
        netWorkRequest()
    }
    
    @objc func loadMoreData() {
        page += 1
        developerRequest.page = page
        netWorkRequest()
    }
    
    private func netWorkRequest() {
        request(developerRequest) { (response, _) in
            if let response = response {
                if self.page == 1 {
                    self.tableView.endHeaderRefreshing()
                    self.developerList.removeAll()
                }
                self.developerList += response.data
                self.checkFooterState(response.data)
                self.dataSource.dataSource = self.developerList
                self.tableView.reloadData()
            } else {
                self.tableView.endHeaderRefreshing()
                self.tableView.endFooterRefreshing()
            }
        }
    }
    
    private func checkFooterState(_ response: [DeveloperModel]) {
        if response.count > 0 {
            self.tableView.mj_footer.isHidden = false
        }
        if response.count == 0 && self.developerList.count > 0 && self.page > 1 {
            self.tableView.endRefreshingWithNoMoreData()
        } else {
            self.tableView.endFooterRefreshing()
        }
    }
}
//
//
//
//// MARK: delegate-datasource
//extension DeveloperViewController {
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return self.developerList.count
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.develpoerTableViewCell, for: indexPath)!
//        cell.develpoer = developerList[indexPath.section]
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let develop = developerList[indexPath.section]
//        let profileVC = R.storyboard.profile.profileViewController()!
//        profileVC.userName = develop.login
//        profileVC.profileViewType = .others
//        profileVC.title = develop.login
//        self.navigationController?.pushViewController(profileVC, animated: true)
//    }
//
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//
//}
//

