//
//  NewsTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/25.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import YYText

class NewsTableViewCell: UITableViewCell {
    var detailLabel: YYLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupDetailLable()
    }
    func setupDetailLable() {
        detailLabel = YYLabel()
        contentView.addSubview(detailLabel)
        detailLabel.frame.origin.y = 10
        detailLabel.frame.origin.x = 60
        detailLabel.frame.size.width = screenWidth - 40 - 10 - 10
        
        detailLabel.displaysAsynchronously = true
        detailLabel.ignoreCommonProperties = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
