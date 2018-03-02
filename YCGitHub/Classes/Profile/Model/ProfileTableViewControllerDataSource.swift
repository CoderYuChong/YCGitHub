//
//  ProfileTableViewControllerDataSource .swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

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
        routing(model)
        
    }
    
    private func routing(_ model: ProfileViewModel) {
        let profileRowType = model.profileRowType
        
        switch profileRowType {
        case .Starred:
            let repositories = RepositoriesViewController()
            repositories.title = "Starred"
            let name = (self.owner?.profileModel?.login)!
            repositories.repositoriesPath = "users/\(name)/starred"
            self.owner?.navigationController?.pushViewController(repositories, animated: true)
        case .Blog:
            let url = URL(string: model.url)!
            let vc = SFSafariViewController(url: url)
            if #available(iOS 11.0, *) {
                vc.dismissButtonStyle = .close
            } else {
                // Fallback on earlier versions
            }
            self.owner?.present(vc, animated: true, completion: nil)
//            self.owner?.navigationController?.pushViewController(vc, animated: true)
        default: break
            
        }
     
        
    }
}


