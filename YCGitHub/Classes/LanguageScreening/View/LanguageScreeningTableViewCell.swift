//
//  LanguageScreeningTableViewCell.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class LanguageScreeningTableViewCell: UITableViewCell {
    @IBOutlet weak var languageLable: UILabel!
    @IBOutlet weak var languageColorView: UIView!
    @IBOutlet weak var checkImageView: UIImageView!

//    var languageModel: LanguageModel {
    //        didSet {
//            languageLable.text = oldValue.languageName
//            languageColorView.backgroundColor = UIColor(oldValue.languageColor!)
//        }
//        
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
