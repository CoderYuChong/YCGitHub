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
    @IBOutlet weak var followButton: FollowButton!
    
    var profileFollowing: Bool? {
         didSet {
            followButton.isHidden = false
            followButton.isSelected = !(profileFollowing!)
        }
    }

    
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
       
        guard (profileModel != nil) else {
            return
        }
        
        switch sender.tag {
        case 0:
            printLog("repositories")
            let name = (profileModel?.login)!
            let repositories = Routing.repositoriesViewController("users/\(name)/repos")
            repositories.title = "Repositories"
            self.superViewController()?.navigationController?.pushViewController(repositories, animated: true)
        case 1:
            printLog("followers")
            let name = (profileModel?.login)!
            let develpoer = Routing.developerViewController("users/\(name)/followers")
            develpoer.title = "Followers"
            self.superViewController()?.navigationController?.pushViewController(develpoer, animated: true)
        case 2:
            printLog("following")
            let name = (profileModel?.login)!
            let develpoer = Routing.developerViewController("users/\(name)/following")
            develpoer.title = "Following"
            self.superViewController()?.navigationController?.pushViewController(develpoer, animated: true)
        default:
            printLog("default")

        }
        
    }
    
    @IBAction func followButtonClick(_ sender: UIButton) {
        
       followUser()
        
    }


}


extension ProfileHeaderView: NetworkAgent {
    func followUser() {
    
        let action = profileFollowing! ? DeveloperFollowingRequest.FollowingAction.Unfollowing : DeveloperFollowingRequest.FollowingAction.Following
        let following = DeveloperFollowingRequest(profileModel!.login, followingAction: action)
        request(following, hander: { (respone, dataResponse) in
            let statusCode = dataResponse.response?.statusCode
            print("----\(String(describing: statusCode))---")
            if statusCode == 204 {
                self.followButton.isSelected = !self.followButton.isSelected
            }
            //            self.headerView.profileFollowing = (statusCode == 204)
        })
    }
}
