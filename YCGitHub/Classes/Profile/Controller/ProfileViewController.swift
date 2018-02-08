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

class ProfileViewController: UITableViewController {

    var profileViewType: ProfileViewType = .mine
    var profileModel: ProfileModel?
    let normalCellID = "normalCellID"
    var userName: String?
    var dataSource: ProfileTableViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupRefresh()
//        loadProfileData()
        // Do any additional setup after loading the view.
    }
    
    private func setUpSettingsData() -> [NormalTableViewCellModel] {
        let setting = NormalTableViewCellModel(iconName: "icon_profile_setting", titleString: "设置", isArrow: true)
        let about = NormalTableViewCellModel(iconName: "icon_profile_about", titleString: "关于", isArrow: true)
        let feedback = NormalTableViewCellModel(iconName: "icon_profile_feedback", titleString: "反馈", isArrow: true)
        return [setting, about, feedback]
    }
    private func setUpTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: normalCellID)
        tableView.register(R.nib.profileHederTableViewCell)
        tableView.register(R.nib.profileNumbersTableViewCell)
    }
    
    private func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadProfileData), beginRefreshing: true)
    }

}

extension ProfileViewController {
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }

}
extension ProfileViewController: NetworkAgent {
    @objc func loadProfileData() {
        request(ProfileRequest(userName: userName)) { (response) in
            if let response = response {
                self.setupViewModel(response)
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupViewModel(_ profileModel: ProfileModel) {
        var sectionArr = [Any]()
        let profileHeder = ProfileViewModel(cellModel: profileModel as AnyObject, cellIdentifier: R.nib.profileHederTableViewCell.identifier, profileViewType: profileViewType)
        let profileNumbers = ProfileViewModel(cellModel: profileModel as AnyObject, cellIdentifier: R.nib.profileNumbersTableViewCell.identifier, profileViewType: profileViewType)
        
        
        
        sectionArr.append([profileHeder,profileNumbers])

        let company = NormalTableViewCellModel(iconName: "icon_profile_company", titleString: profileModel.company ?? "", isArrow: true)
        let email = NormalTableViewCellModel(iconName: "icon_profile_email", titleString: profileModel.email ?? "Not Set", isArrow: true)
        let place = NormalTableViewCellModel(iconName: "icon_profile_place", titleString: profileModel.location ?? "", isArrow: true)
        let blog = NormalTableViewCellModel(iconName: "icon_profile_link", titleString: profileModel.blog.count == 0 ? profileModel.blog :"", isArrow: true)
        
        
        let companyCell = ProfileViewModel(cellModel: company as AnyObject, cellIdentifier: normalCellID, profileViewType: profileViewType)
        let emailCell = ProfileViewModel(cellModel: email as AnyObject, cellIdentifier: normalCellID, profileViewType: profileViewType)
        let placeCell = ProfileViewModel(cellModel: place as AnyObject, cellIdentifier: normalCellID, profileViewType: profileViewType)
        let blogCell = ProfileViewModel(cellModel: blog as AnyObject, cellIdentifier: normalCellID, profileViewType: profileViewType)
        
        sectionArr.append([companyCell,emailCell,placeCell,blogCell])
        if profileViewType == .mine {
            let setting = NormalTableViewCellModel(iconName: "icon_profile_setting", titleString: "设置", isArrow: true)
            let settingCell = ProfileViewModel(cellModel: setting as AnyObject, cellIdentifier: normalCellID, profileViewType: profileViewType)
            sectionArr.append([settingCell])
        }
        
        dataSource = ProfileTableViewControllerDataSource(dataSource: sectionArr as! Array<[ProfileViewModel]>, settings: setUpSettingsData(), owner: nil)
        tableView.dataSource = dataSource

    }
    
}

