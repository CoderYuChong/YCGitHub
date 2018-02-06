//
//  RepositoriesTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class RepositoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var respoNameLable: UILabel!
    @IBOutlet weak var respoDescLable: UILabel!
    @IBOutlet weak var languageNameLable: UILabel!
    @IBOutlet weak var starNumberLable: UILabel!
    @IBOutlet weak var forkNumberLable: UILabel!
    
    var repositoriesModel: TrendingRepositoriesModel? {
        didSet {
            respoNameLable.text = repositoriesModel?.repo
            respoDescLable.text = repositoriesModel?.desc
            languageNameLable.text = repositoriesModel?.lang
            starNumberLable.text = repositoriesModel?.stars
            forkNumberLable.text = repositoriesModel?.forks
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
