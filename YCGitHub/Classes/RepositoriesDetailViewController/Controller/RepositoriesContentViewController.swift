//
//  RepositoriesContentViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class RepositoriesContentViewController: UITableViewController {
    var repositoriesName: String = ""
    var contentsPath: String = ""
    lazy var contentList: [RepositoriesContentModel] = [RepositoriesContentModel]()
    let repositoriesContentCell = "RepositoriesContentCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = repositoriesName
        setUpTableView()
        setupRefresh()
    }
    
    private func setUpTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.rowHeight = 44
        tableView.register(R.nib.repositoriesDetailHeaderTableViewCell)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: repositoriesContentCell)
    }

    
    
    private func setupRefresh() {
        tableView.headerRefresh(target: self, refreshingAction: #selector(loadContent), beginRefreshing: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return contentList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: repositoriesContentCell, for: indexPath)
        let content = contentList[indexPath.section]
        cell.imageView?.image = content.imageIcon
        cell.textLabel?.text = content.name
        cell.accessoryType = (content.type == .dir ? .disclosureIndicator : .none)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let content = contentList[indexPath.section]
        if content.type == .dir {
            let repoContentVC = Routing.repositoriesContentViewController(repositoriesName, contentsPath: content.path, contentName: content.name)
            self.navigationController?.pushViewController(repoContentVC, animated: true)
            
        } else {
            let fileVC =  Routing.fileContentViewController(htmlURL: content.htmlURL, contentName: content.name)
            self.navigationController?.pushViewController(fileVC, animated: true)
        }
    }
    
    
}

extension RepositoriesContentViewController: NetworkAgent {
    @objc private func loadContent() {
        let contentRequest = RepositoriesContentRequest(repositoriesName, contentsPath: contentsPath)
        request(contentRequest) { (response, _) in
            self.tableView.endHeaderRefreshing()
            if let response = response {
                self.sortList(response.data)
            }
        }
    }
    private func sortList(_ response: [RepositoriesContentModel]) {
        let dir = response.filter({$0.type == .dir})
        let file = response.filter({$0.type != .dir})
        self.contentList = dir + file
        self.tableView.reloadData()
    }
    
}


