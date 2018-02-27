//
//  RepositoriesViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/27.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class RepositoriesViewController: UITableViewController {
    var repositoriesPath: String!
    var page: Int = 1
    lazy var repositoriesRequest: RepositoriesRequest = RepositoriesRequest(repositoriesPath)
    
    lazy var repositoriesList: [RepositoriesModelElement] = [RepositoriesModelElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100;
        tableView.register(R.nib.repositoriesTableViewCell)
        setupRefresh()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

// MARK: UI
extension RepositoriesViewController {
    fileprivate func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: true)
        tableView.footerRefresh(target: self, refreshingAction: #selector(loadMoreData), automaticallyRefresh: false, triggerAutomaticallyRefreshPercent: 30)
        
    }
}

// MARK: Network
extension RepositoriesViewController: NetworkAgent {
    @objc func loadData() {
        request(repositoriesRequest) { (response, _) in
            if let response = response {
                if self.page == 1 {
                    self.tableView.endHeaderRefreshing()
                    self.repositoriesList.removeAll()
                }
                self.repositoriesList += response.data
                self.checkFooterState(response.data)
                self.tableView.reloadData()
            } else {
                self.tableView.endHeaderRefreshing()
                self.tableView.endFooterRefreshing()
            }
        }
    }
    
    @objc func loadMoreData() {
        page += 1
        repositoriesRequest.page = page
        loadData()
    }
    
    func checkFooterState(_ response: [RepositoriesModelElement]) {
        if response.count > 0 {
            self.tableView.mj_footer.isHidden = false
        }
        if response.count == 0 && self.repositoriesList.count > 0 && self.page > 1 {
            self.tableView.endRefreshingWithNoMoreData()
        } else {
            self.tableView.endFooterRefreshing()

        }
    }
}



// MARK: delegate-datasource
extension RepositoriesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoriesList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.repositoriesTableViewCell, for: indexPath)!
        cell.repositories = repositoriesList[indexPath.row]
        return cell;
    }
    
}




