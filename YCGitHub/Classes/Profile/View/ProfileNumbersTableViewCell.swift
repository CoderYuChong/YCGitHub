//
//  ProfileNumbersTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class ProfileNumbersTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoriesLable: UILabel!
    @IBOutlet weak var followersLable: UILabel!
    @IBOutlet weak var followingLable: UILabel!
    
    var profileModel: ProfileModel? {
        didSet {
            repositoriesLable.text = String(profileModel?.publicRepos ?? 0)
            followersLable.text = String(profileModel?.followers ?? 0)
            followingLable.text = String(profileModel?.following ?? 0)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
