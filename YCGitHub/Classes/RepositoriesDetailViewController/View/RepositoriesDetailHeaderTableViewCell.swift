//
//  RepositoriesDetailHeaderTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import YYText

class RepositoriesDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var repositoriesDescLable: UILabel!
    @IBOutlet weak var repositoriesNameLable: YYLabel!
    @IBOutlet weak var stargazersLable: UILabel!
    @IBOutlet weak var watchersLable: UILabel!
    @IBOutlet weak var forksLable: UILabel!
    @IBOutlet weak var updateTime: UILabel!
    
    var repositoriesModel: RepositoriesModel? {
        didSet {
            
            guard let repositoriesModel = repositoriesModel else {
                return
            }
            
            userButton.setBackgroundImage(with: repositoriesModel.owner?.avatarURL, for: .normal, placeholder: R.image.icon_avatar_default())
            repositoriesDescLable.text = repositoriesModel.description
            let attributedText = NSMutableAttributedString(string: repositoriesModel.fullName)
            attributedText.yy_font = UIFont.systemFont(ofSize: 14)
            attributedText.yy_color = repoTitleColor
            
            if let userName = repositoriesModel.owner?.login, repositoriesModel.fullName.contains(userName) {
                let range = NSRange(location: 0,length: userName.count)
                attributedText.yy_setTextHighlight(range, color: repoTitleColor, backgroundColor: UIColor.clear) { (containerView, text, range, rect) in
                    self.userButtonClick(nil)
                }
            }
            repositoriesNameLable.attributedText = attributedText
            updateTime.text = "update " + repositoriesModel.pushedAt.timeString()
            stargazersLable.text = String(describing: repositoriesModel.stargazersCount)
            watchersLable.text = String(describing: repositoriesModel.watchersCount)
            forksLable.text = String(describing: repositoriesModel.forks)

            
        }
    }
    
    
    
    @IBAction func userButtonClick(_ sender: UIButton?) {
        print("userButtonClick")
        if let userName = repositoriesModel?.owner?.login {
            let profileVC = Routing.profileViewController(userName, profileViewType: .others)
            self.superViewController()?.navigationController?.pushViewController(profileVC, animated: true)
        }
        
        
    }
    // tag 0 Stargazers 1 Watchers2 Forks
    @IBAction func buttonClick(_ sender: UIButton) {
        
        guard let repositoriesModel = repositoriesModel else {
            return
        }
        
        switch sender.tag {
        case 0:
            let developerVC = Routing.developerViewController("repos/" + repositoriesModel.fullName + "/stargazers")
            developerVC.title = "Stargazers"
            self.superViewController()?.navigationController?.pushViewController(developerVC, animated: true)
            print("Stargazers")
        case 1:
            let developerVC = Routing.developerViewController("repos/" + repositoriesModel.fullName + "/subscribers")
            developerVC.title = "Watchers"
            self.superViewController()?.navigationController?.pushViewController(developerVC, animated: true)
            print("Watchers2")
        case 2:
            let repoVC = Routing.repositoriesViewController("repos/" + repositoriesModel.fullName + "/forks")
            repoVC.title = "Forks"
            self.superViewController()?.navigationController?.pushViewController(repoVC, animated: true)
        default:
            print("----")
        }
        
    }
    
}
