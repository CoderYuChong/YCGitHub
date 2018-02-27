//
//  ProfileViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import SwiftMessages

enum ProfileViewType {
    case mine, others
}

let profileCellID = "ProfileCellID"
class ProfileViewController: UITableViewController {

    var profileViewType: ProfileViewType = .mine
    var profileModel: ProfileModel?
    let normalCellID = "normalCellID"
    var userName: String?
    var dataSource: ProfileTableViewControllerDataSource!
    lazy var headerView: ProfileHeaderView = {
        let headerView = R.nib.profileHeaderView.firstView(owner: self)!
        headerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 164)
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupRefresh()
//        loadProfileData()
        // Do any additional setup after loading the view.
    }
    
    
    private func setUpTableView() {
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: profileCellID)
        let tempView = UIView(frame: headerView.bounds)
        tempView.addSubview(headerView)
        tableView.tableHeaderView = tempView
    }
    
    private func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadProfileData), beginRefreshing: true)
    }
    
    deinit {
        printLog("-----ProfileViewController-----")
    }

}


extension ProfileViewController: NetworkAgent {
    @objc func loadProfileData() {
        request(ProfileRequest(userName: userName)) { (response, _) in
            self.tableView.endHeaderRefreshing()
            if let response = response {
                self.setupViewModel(response)
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupViewModel(_ profileModel: ProfileModel) {
        let starred = ProfileViewModel(profileRowType: .Starred, iconName: "", url: profileModel.starredURL)
        let event = ProfileViewModel(profileRowType: .Event, iconName: "", url: profileModel.eventsURL)
        let organizations = ProfileViewModel(profileRowType: .Organizations, iconName: "", url: profileModel.organizationsURL)
//        let repo = ProfileViewModel(profileRowType: .Repositories, iconName: "", url: profileModel.reposURL)
        let gists = ProfileViewModel(profileRowType: .Gists, iconName: "", url: profileModel.gistsURL)
        var sectionArr: [ProfileViewModel] = [starred, event, organizations, gists]

        if profileModel.blog.count != 0 {
            let blog = ProfileViewModel(profileRowType: .Blog, iconName: "", url: profileModel.blog)
            sectionArr.append(blog)
        }
        dataSource = ProfileTableViewControllerDataSource(dataSource: sectionArr, owner: self)
        headerView.profileModel = profileModel
        self.profileModel = profileModel
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
}

