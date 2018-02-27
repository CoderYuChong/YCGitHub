//
//  ProfileViewModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/8.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit
enum ProfileRowType: String {
    case Starred
    case Event
    case Organizations
    case Repositories
    case Gists
    case Blog
}

class ProfileViewModel: NSObject {
    let profileRowType: ProfileRowType
    
    let titleName: String
    let iconName: String
    let url: String
    
    init(profileRowType: ProfileRowType, iconName: String, url: String) {
        self.profileRowType = profileRowType
        self.titleName = profileRowType.rawValue
        self.iconName = iconName
        self.url = url
    }
    
}
