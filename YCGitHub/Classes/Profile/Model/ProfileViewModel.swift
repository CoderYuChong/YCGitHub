//
//  ProfileViewModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/8.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewModel: NSObject {
//    let cellHeight: CGFloat
    let cellModel: AnyObject
    let cellIdentifier: String
    let profileViewType: ProfileViewType
    
    init(cellModel: AnyObject, cellIdentifier: String, profileViewType: ProfileViewType = .mine) {
        self.cellIdentifier = cellIdentifier
        self.cellModel = cellModel
        self.profileViewType = profileViewType
//        self.cellHeight = cellHeight
    }
    
}
