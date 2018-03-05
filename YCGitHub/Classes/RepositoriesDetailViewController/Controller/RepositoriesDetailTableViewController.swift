//
//  RepositoriesDetailTableViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class RepositoriesDetailTableViewController: UITableViewController {
    var repositoriesName: String = ""
    var repositoriesModel: RepositoriesModel?
    var starred: Bool = false
    var watch: Bool = false
    lazy var dataSource: RepositoriesDetailTableViewDataSource = RepositoriesDetailTableViewDataSource(owner: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setUpTableView()
        if let repositoriesModel = repositoriesModel {
            repositoriesName = repositoriesModel.name
            handelData()
        } else {
            setupRefresh()
        }
        
        repositoriesStateHandle(action: .starred, folllow: .CheckFollow)
        repositoriesStateHandle(action: .watch, folllow: .CheckFollow)

    }
    private func setupNav() {
        let barItem = UIBarButtonItem(image: R.image.icon_profile_share(), style: .plain, target: self, action: #selector(repoAction))
        self.navigationItem.rightBarButtonItem = barItem
    }
    
    
    private func setUpTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedRowHeight = 80
        tableView.register(R.nib.repositoriesDetailHeaderTableViewCell)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "RepositoriesDetailCell")
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    private func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadData), beginRefreshing: true)
    }
    
    @objc private func repoAction() {
        let aleart = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        // 2.创建并添加按钮
        
        let starAction = UIAlertAction(title: starred ? "UnStar" : "Star", style: .default) { (action) in
            self.repositoriesStateHandle(action: .starred, folllow: self.starred ? .Unfollowing: .Following)
            
        }
        let watchlAction = UIAlertAction(title: watch ? "UnWatch" : "Watch", style: .default) { (action) in
            self.repositoriesStateHandle(action: .watch, folllow: self.watch ? .Unfollowing: .Following)
        }
        let forkAction = UIAlertAction(title: "Fork", style: .default) { (action) in
            
        }
        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        aleart.addAction(starAction)
        aleart.addAction(watchlAction)
        aleart.addAction(forkAction)
        aleart.addAction(cancleAction)
        self.present(aleart, animated: true, completion: nil)

    }
    
    
    
    
}


extension RepositoriesDetailTableViewController: NetworkAgent {
    @objc private func loadData() {
        let repo = RepositoriesDetailRequest(repositoriesName)
        request(repo) { (response, _) in
            self.tableView.endHeaderRefreshing()
            if let response = response {
                self.repositoriesModel = response
                self.handelData()
            }
        }
    }
    
    
    private func repositoriesStateHandle(action: RepositoriesStateRequest.Action, folllow: RepositoriesStateRequest.Following) {
        
        let starred = RepositoriesStateRequest(repositoriesName, action: action, followingAction: folllow)
        request(starred) { (response, dataResponse) in
            let statusCode = dataResponse.response?.statusCode
            
            switch action {
            case .watch:
                print("")
                switch folllow {
                case .CheckFollow:
                    self.watch = (statusCode == 204)
                case .Following:
                    self.watch = (statusCode == 204)
                    YCHUD.show(title: "watch \"\(self.repositoriesName)\" success", theme: .success)
                case .Unfollowing:
                    self.watch = !(statusCode == 204)
                    YCHUD.show(title: "unwatch \"\(self.repositoriesName)\" success", theme: .success)
                }
            case .starred:
                switch folllow {
                case .CheckFollow:
                    self.starred = (statusCode == 204)
                case .Following:
                    self.starred = (statusCode == 204)
                    YCHUD.show(title: "star \"\(self.repositoriesName)\" success", theme: .success)
                case .Unfollowing:
                    self.starred = !(statusCode == 204)
                    YCHUD.show(title: "unstar \"\(self.repositoriesName)\" success", theme: .success)

                }
                
            }
        }
        
        
    }
    
    
    
    private func handelData() {
        guard let repositoriesModel = repositoriesModel else {
            return
        }
        self.title = repositoriesModel.name
        dataSource.repositoriesModel = repositoriesModel
        tableView.reloadData()
    }
    
}
