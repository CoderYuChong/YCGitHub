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
    var profileModel: ProfileModel?
    weak var owner: ProfileViewController?
    enum Section: Int {
        case header = 0,settings,max
    }
    
    init(profileModel: ProfileModel?, settings: [NormalTableViewCellModel], owner: ProfileViewController?) {
        self.settings = settings
        self.profileModel = profileModel
        self.owner = owner
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.max.rawValue
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            fatalError()
        }
        switch section {
        case .header: return 2
        case .settings: return settings.count
        case .max: fatalError()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        print(indexPath.row)
        
        print(section)
        switch section {
        case .header:
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.profileHederTableViewCell, for: indexPath)!
                cell.profileModel = profileModel
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.profileNumbersTableViewCell, for: indexPath)!
                cell.profileModel = profileModel
                return cell
            }
            
        case .settings:
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalCellID", for: indexPath)
            let setting = settings[indexPath.row]
            cell.textLabel?.text = setting.titleString
            cell.imageView?.image = UIImage(named: setting.iconName)
//            cell.arro
            return cell
        default:
            fatalError()
        }
    }
}
