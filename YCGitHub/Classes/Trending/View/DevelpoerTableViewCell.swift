//
//  DevelpoerTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import Kingfisher

class DevelpoerTableViewCell: UITableViewCell {

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var userAddressLable: UILabel!
    var develpoerModel: TrendingDevelpoerModel? {
        didSet {
            userNameLable.text = (develpoerModel?.user ?? "") + (develpoerModel?.full_name ?? "")
            userAddressLable.text = develpoerModel?.user_link
            userIcon.setImage(with: develpoerModel?.developer_avatar, placeholder: R.image.icon_avatar_default())
        }
    }
    
    
    var develpoer: DeveloperModel? {
        didSet {
            userNameLable.text = (develpoer?.login ?? "")
            userAddressLable.text = develpoer?.url
            userIcon.setImage(with: develpoer?.avatarURL, placeholder: R.image.icon_avatar_default())
        
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
