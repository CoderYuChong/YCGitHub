//
//  AboutViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/20.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class AboutViewController: UITableViewController {
    let aboutCellId = "aboutCellId"
    @IBOutlet weak var versionLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "关于"
        setupTableView()
        setVersion()
    }
    private func setVersion() {
        
        guard let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String else {
            return
        }
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return
        }
        
        let versionString = "Version " + version + "(\(build))"
        versionLable.text = versionString
    }
    
    private func setupTableView() {
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedRowHeight = 44
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: aboutCellId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: aboutCellId, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Source Code"
        case 1:
            cell.textLabel?.text = "Author"
        case 2:
            cell.textLabel?.text = "Feedback"
        default:
            fatalError("error")
        }
        // Configure the cell...

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
        
        switch indexPath.section {
        case 0:
            let repoVC = Routing.repositoriesDetailTableViewController("CoderYuChong/YCGitHub")
            self.navigationController?.pushViewController(repoVC, animated: true)
        case 1:
            let profileVC = Routing.profileViewController("CoderYuChong", profileViewType: .others)
            self.navigationController?.pushViewController(profileVC, animated: true)
        case 2:
            let feedBackVC = Routing.feedBackViewController()
        self.navigationController?.pushViewController(feedBackVC, animated: true)
        default:
            print("other")
        }
        
    }
    
    
    

}
