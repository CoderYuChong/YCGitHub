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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100;
        tableView.register(R.nib.develpoerTableViewCell)
        setupRefresh()

        // Do any additional setup after loading the view.
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
        request(developerRequest) { (response, _) in
            if let response = response {
                if self.page == 1 {
                    self.tableView.endHeaderRefreshing()
                    self.developerList.removeAll()
                }
                self.developerList += response.data
                self.checkFooterState(response.data)
                self.checkUserFollowing(response.data)
                self.tableView.reloadData()
            } else {
                self.tableView.endHeaderRefreshing()
                self.tableView.endFooterRefreshing()
            }
        }
    }
    
    @objc func loadMoreData() {
        page += 1
        developerRequest.page = page
        loadData()
    }
    
    func checkUserFollowing(_ develpers: [DeveloperModel]) {
        for user in develpers {
            let following = DeveloperFollowingRequest(user.login)
            request(following, hander: { (respone, dataResponse) in
                let statusCode = dataResponse.response?.statusCode
                print("----\(String(describing: statusCode))---")
                if statusCode == 204 { // follow
//                    user.f
                } else {
                    
                }
            })
            
        }
        
    }
    
    func checkFooterState(_ response: [DeveloperModel]) {
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



// MARK: delegate-datasource
extension DeveloperViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.developerList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.develpoerTableViewCell, for: indexPath)!
        cell.develpoer = developerList[indexPath.row]
        return cell;
    }
    
}


