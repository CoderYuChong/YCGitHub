//
//  DeveloperTableViewDataSource.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit

class DeveloperTableViewDataSource: NSObject {
    var dataSource: [DeveloperModel]
    weak var owner: UIViewController?
    
    init(dataSource: [DeveloperModel], owner: UIViewController?) {
        self.dataSource = dataSource
        self.owner = owner
    }
}




// MARK: delegate-datasource
extension DeveloperTableViewDataSource: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.develpoerTableViewCell, for: indexPath)!
        cell.develpoer = dataSource[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let develop = dataSource[indexPath.section]
        let profileVC = R.storyboard.profile.profileViewController()!
        profileVC.userName = develop.login
        profileVC.profileViewType = .others
        profileVC.title = develop.login
        self.owner?.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}



