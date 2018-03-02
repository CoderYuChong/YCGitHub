
//
//  RepositoriesDetailRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

class RepositoriesDetailRequest: BaseRequest {
    typealias Response = RepositoriesModel
    
    var path: String {
        return "repos/\(repositoriesName)"
    }
    
    var repositoriesName: String
    
    init(_ repositoriesName: String) {
        self.repositoriesName = repositoriesName
    }
}

