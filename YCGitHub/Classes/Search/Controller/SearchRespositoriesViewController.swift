//
//  SearchRespositoriesViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class SearchRespositoriesViewController: UIViewController {

    
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
        tableView.register(R.nib.repositoriesTableViewCell)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        return tableView
    }()
    
    lazy var dataSource: RepositoriesTableViewDataSource = RepositoriesTableViewDataSource(dataSource: [], owner: self)
    lazy var searchRespositoriesRequest: SearchRespositoriesRequest = SearchRespositoriesRequest("")
    var page: Int = 1
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Respositories"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = "Respositories"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Respositories"
        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor("0xf2f2f2")
        searchBar.delegate = self
        view.addSubview(searchBar)
        setupTableView()
        setupRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        loadRespositoriesData()
    }

}

extension SearchRespositoriesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("-----searchBarSearchButtonClicked---")
        view.endEditing(true)
        if let searchKey = searchBar.text {
            searchRespositoriesRequest.searchKey = searchKey
            page = 1
            loadRespositoriesData()
        }
    }
}

extension SearchRespositoriesViewController: NetworkAgent {
    private func loadRespositoriesData() {
        searchRespositoriesRequest.page = page
        request(searchRespositoriesRequest) { (response, _) in
            if let response = response {
                if self.page == 1 {
                    self.dataSource.repositoriesList = response.items
                    self.tableview.mj_footer.isHidden = false
                } else {
                    self.dataSource.repositoriesList += response.items
                }
                if response.total_count == self.dataSource.repositoriesList.count {
                    self.tableview.endRefreshingWithNoMoreData()
                } else {
                    self.tableview.endFooterRefreshing()
                }
                self.tableview.reloadData()
            }
        }
    }
}
