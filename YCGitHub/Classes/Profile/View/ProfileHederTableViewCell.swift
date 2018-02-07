//
//  ProfileHederTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class ProfileHederTableViewCell: UITableViewCell {

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var descLable: UILabel!
    @IBOutlet weak var joinTimeLable: UILabel!
    
    
    var profileModel: ProfileModel? {
        didSet {
            userIcon.setImage(with: profileModel?.avatarUrl)
            userNameLable.text = profileModel?.name
            joinTimeLable.text = profileModel?.createdAt
//            descLable.text = profileModel?.createdAt
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
