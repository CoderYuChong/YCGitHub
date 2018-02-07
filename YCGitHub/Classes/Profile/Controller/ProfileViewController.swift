//
//  ProfileViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import SwiftMessages

class ProfileViewController: UITableViewController {
    var profileModel: ProfileModel?
    let normalCellID = "normalCellID"
    var dataSource: ProfileTableViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        loadProfileData()
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
        dataSource = ProfileTableViewControllerDataSource(profileModel: nil, settings: setUpSettingsData(), owner: nil)
        tableView.dataSource = dataSource
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
    func loadProfileData() {
        
        request(ProfileRequest()) { (response) in
            if let response = response {
//                self.profileModel = response
                self.dataSource.profileModel = response
                self.tableView.reloadData()
            }
        }
    }
    
}

