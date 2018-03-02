//
//  RepositoriesDetailViewModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

enum RepositoriesDetailRowType: String {
    case language
    case issue
    case pullRequest
    case readme
}

class RepositoriesDetailViewModel: NSObject {
    let repositoriesDetailRowType: RepositoriesDetailRowType
    
    let titleName: String
    let iconName: String
    let url: String
    
    init(repositoriesDetailRowType: RepositoriesDetailRowType,titleName: String ,iconName: String, url: String = "") {
        self.repositoriesDetailRowType = repositoriesDetailRowType
        self.titleName = titleName
        self.iconName = iconName
        self.url = url
    }
    
}
