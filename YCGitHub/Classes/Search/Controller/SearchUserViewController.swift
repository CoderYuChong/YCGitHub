//
//  SearchUserViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class SearchUserViewController: UIViewController {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 10, y: 10, width: screenWidth - 20, height: 50)
        searchBar.backgroundImage = UIImage(color: UIColor("0xf2f2f2"))
        searchBar.backgroundColor = .clear
        return searchBar
    }()
    
    lazy var tableview: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
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
        return tableView
    }()
    
    lazy var dataSource: DeveloperTableViewDataSource = DeveloperTableViewDataSource(dataSource: [], owner: self)
    lazy var searchUserRequest: SearchUserRequest = SearchUserRequest("")
    var page: Int = 1
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "User"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = "User"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User"
        print("-----User-----")

        view.backgroundColor = UIColor("0xf2f2f2")
        searchBar.delegate = self
        view.addSubview(searchBar)
        setupTableView()
        setupRefresh()
    }
    
    private func setupTableView() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom)
        }
        
    }
    
    private func setupRefresh() {
        tableview.footerRefresh(target: self, refreshingAction: #selector(loadMoreData), automaticallyRefresh: false, triggerAutomaticallyRefreshPercent: 10)
    }
    @objc private func loadMoreData() {
        page += 1
        loadUserData()
    }

}

extension SearchUserViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("-----searchBarSearchButtonClicked---")
        view.endEditing(true)
        if let searchKey = searchBar.text {
            searchUserRequest.searchKey = searchKey
            page = 1
            loadUserData()
        }
    }
}


extension SearchUserViewController: NetworkAgent {
    private func loadUserData() {
        searchUserRequest.page = page
        request(searchUserRequest) { (response, _) in
            if let response = response {
                if self.page == 1 {
                    self.dataSource.dataSource = response.items
                    self.tableview.mj_footer.isHidden = false
                } else {
                    self.dataSource.dataSource += response.items
                }
                if response.total_count == self.dataSource.dataSource.count {
                    self.tableview.endRefreshingWithNoMoreData()
                } else {
                    self.tableview.endFooterRefreshing()
                }
                self.tableview.reloadData()
            }
        }
    }
}
