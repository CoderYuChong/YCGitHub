//
//  SearchRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

class SearchUserRequest: BaseRequest {
    typealias Response = SearchUserModel
    var path: String {
        return "search/users"
    }
    
    var searchKey: String
    var page: Int
    func parameters() -> [String : String] {
        return  ["q": searchKey, "page": String(page)]
    }
    
    init(_ searchKey: String) {
        self.searchKey = searchKey
        self.page = 1
    }
    
    
    
}

struct SearchUserModel: DecodableJSON {
    var items: [DeveloperModel]
    let total_count: Int
}

class SearchRespositoriesRequest: BaseRequest {
    typealias Response = SearchRespositoriesModel
    var path: String {
        return "search/repositories"
    }
    
    var searchKey: String
    var page: Int
    func parameters() -> [String : String] {
        return  ["q": searchKey, "page": String(page)]
    }
    
    init(_ searchKey: String) {
        self.searchKey = searchKey
        self.page = 1
    }
    
    
    
}

struct SearchRespositoriesModel: DecodableJSON {
    var items: [RepositoriesModel]
    let total_count: Int
}

