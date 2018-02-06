//
//  TrendingHeaderView.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class TrendingHeaderView: UIView {
    @IBOutlet weak var trendingLable: UILabel!
    
    var trendingString: String? {
        didSet{
            trendingLable.text = trendingString
        }
    }
}
