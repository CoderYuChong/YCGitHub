
//
//  RepositoriesDetailTableViewDataSource.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit

class RepositoriesDetailTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var rowDatas: [RepositoriesDetailViewModel] = []
    var repositoriesModel: RepositoriesModel? {
        didSet {
            guard let repositoriesModel = repositoriesModel else {
                return
            }
            let language = RepositoriesDetailViewModel(repositoriesDetailRowType: .language, titleName: repositoriesModel.language ?? "Unknown", iconName: "icon_repo_detail_fork")
            let issue = RepositoriesDetailViewModel(repositoriesDetailRowType: .issue, titleName: "Issue", iconName: "icon_repo_detail_Issue")
            let pullRequest = RepositoriesDetailViewModel(repositoriesDetailRowType: .pullRequest, titleName: "Pull Request", iconName: "icon_repo_detail_pull_request")
            let readme = RepositoriesDetailViewModel(repositoriesDetailRowType: .readme, titleName: "README", iconName: "icon_repo_detail_readme")
            rowDatas = [language, issue, pullRequest, readme]
        }
    }
    weak var owner: UIViewController?
    enum Section: Int {
        case header = 0,todos,max
    }
    
    init( owner: UIViewController?) {
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
        case .header: return 1
        case .todos: return rowDatas.count
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
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.repositoriesDetailHeaderTableViewCell, for: indexPath)!
            cell.repositoriesModel = repositoriesModel
            return cell
        case .todos:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesDetailCell", for: indexPath)
            let rowData = rowDatas[indexPath.row]
            cell.textLabel?.text = rowData.titleName
            cell.imageView?.image = UIImage(named: rowData.iconName)
            cell.accessoryType = .disclosureIndicator
            
            return cell
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        print(indexPath.row)
        
        print(section)
        switch section {
        case .header:
            print("header")
        case .todos:
            let rowData = rowDatas[indexPath.row]
            switch rowData.repositoriesDetailRowType {
            case .language:
                let repo = RepositoriesContentViewController()
                repo.repositoriesName = (repositoriesModel?.fullName)!
                repo.contentsPath = ""
                repo.title = (repositoriesModel?.fullName)!
                self.owner?.navigationController?.pushViewController(repo, animated: true)
            default: break
            }
      
            
        default: break
            
        }
        
        
//        RepositoriesContentViewController
    }
    
    
    
}
