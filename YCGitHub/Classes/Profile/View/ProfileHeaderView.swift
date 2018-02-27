//
//  ProfileHeaderView.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/27.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var descLable: UILabel!
    @IBOutlet weak var repositoriesLable: UILabel!
    @IBOutlet weak var followersLable: UILabel!
    @IBOutlet weak var followingLable: UILabel!
    
    var profileModel: ProfileModel? {
        didSet {
            userIcon.setImage(with: profileModel?.avatarURL)
            
            var userName: String = (profileModel?.login)!
            if let name = profileModel?.name {
                userName = userName + "(\(name))"
            }
            
            userNameLable.text = userName
            descLable.text = profileModel?.bio ?? "Not Desscribed"
            repositoriesLable.text = String(profileModel?.publicRepos ?? 0)
            followersLable.text = String(profileModel?.followers ?? 0)
            followingLable.text = String(profileModel?.following ?? 0)
        }
    }
    
    // tag 0 repositories 1 followers 2 following
    @IBAction func buttonClick(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            printLog("repositories")
            let repositories = RepositoriesViewController()
            repositories.title = "Repositories"
            let name = (profileModel?.login)!
            repositories.repositoriesPath = "users/\(name)/repos"
            self.superViewController()?.navigationController?.pushViewController(repositories, animated: true)
        case 1:
            printLog("followers")
            let develpoer = DeveloperViewController()
            develpoer.title = "Followers"
            let name = (profileModel?.login)!
            develpoer.developerPath = "users/\(name)/followers"
            self.superViewController()?.navigationController?.pushViewController(develpoer, animated: true)
        case 2:
            printLog("following")
            let develpoer = DeveloperViewController()
            develpoer.title = "Following"
            let name = (profileModel?.login)!
            develpoer.developerPath = "users/\(name)/following"
            self.superViewController()?.navigationController?.pushViewController(develpoer, animated: true)
        default:
            printLog("default")

        }
        
    }
    

}
