//
//  NormalTableViewCellModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

struct NormalTableViewCellModel {
    var iconName: String
    var titleString: String
    var isArrow: Bool?
    init(iconName: String, titleString: String, isArrow: Bool = true) {
        self.iconName = iconName
        self.titleString = titleString
        self.isArrow = isArrow
    }
}
