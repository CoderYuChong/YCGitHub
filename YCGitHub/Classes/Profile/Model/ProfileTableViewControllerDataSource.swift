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
    var dataSource: [ProfileViewModel]
    weak var owner: ProfileViewController?
 
    
    init(dataSource: [ProfileViewModel], owner: ProfileViewController?) {
        self.dataSource = dataSource
        self.owner = owner
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellID", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        let model = dataSource[indexPath.row]
        cell.imageView?.image = UIImage(named: model.iconName)
        cell.textLabel?.text = model.titleName
        return cell
    }
}


extension ProfileTableViewControllerDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = dataSource[indexPath.row]
        routing(model.profileRowType)
        
    }
    
    private func routing(_ profileRowType: ProfileRowType) {
        
        switch profileRowType {
        case .Starred:
            let repositories = RepositoriesViewController()
            repositories.title = "Starred"
            let name = (self.owner?.profileModel?.login)!
            repositories.repositoriesPath = "users/\(name)/starred"
            self.owner?.navigationController?.pushViewController(repositories, animated: true)
        default: break
            
        }
     
        
    }
}


