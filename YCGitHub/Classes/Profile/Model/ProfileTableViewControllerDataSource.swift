//
//  ProfileTableViewControllerDataSource .swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit

class ProfileTableViewControllerDataSource: NSObject,UITableViewDataSource {
    var settings: [NormalTableViewCellModel]
    var dataSource: Array<[ProfileViewModel]>
    weak var owner: ProfileViewController?
    enum Section: Int {
        case header = 0,settings,max
    }
    
    init(dataSource: Array<[ProfileViewModel]>, settings: [NormalTableViewCellModel], owner: ProfileViewController?) {
        self.settings = settings
        self.dataSource = dataSource
        self.owner = owner
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = dataSource[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath)
       
        if (viewModel.cellIdentifier == R.nib.profileHederTableViewCell.identifier) {
        
            let profile = cell as! ProfileHederTableViewCell
            profile.profileModel = viewModel.cellModel as? ProfileModel
        } else if (viewModel.cellIdentifier == R.nib.profileNumbersTableViewCell.identifier) {
            
            let profile = cell as! ProfileNumbersTableViewCell
            profile.profileModel = viewModel.cellModel as? ProfileModel
        } else {
            let normalmodel =  viewModel.cellModel as? NormalTableViewCellModel
            cell.textLabel?.text = normalmodel?.titleString.count == 0 ? "Not Set" : normalmodel?.titleString
            cell.imageView?.image = UIImage(named: (normalmodel?.iconName)!)
            if (normalmodel?.titleString.isEmpty)!{
                cell.accessoryType = .none
            } else {
                cell .accessoryType = .disclosureIndicator
            }
            return cell
        }
        
        return cell
        
    }
}
