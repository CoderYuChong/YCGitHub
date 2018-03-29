//  RepositoriesTableViewDataSource.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class RepositoriesTableViewDataSource: NSObject {
    
    var repositoriesList: [RepositoriesModel]
    weak var owner: UIViewController?
    
    init(dataSource: [RepositoriesModel], owner: UIViewController?) {
        self.repositoriesList = dataSource
        self.owner = owner
    }


}

// MARK: delegate-datasource
extension RepositoriesTableViewDataSource: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoriesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.repositoriesTableViewCell, for: indexPath)!
        cell.repositories = repositoriesList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repoDetailVC = Routing.repositoriesDetailTableViewController("", repositoriesModel: repositoriesList[indexPath.row])
        self.owner?.navigationController?.pushViewController(repoDetailVC, animated: true)
    }
    
    
}
