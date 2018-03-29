
//
//  FeedBackRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/22.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import Alamofire


struct FeedBackRequest: BaseRequest {
    typealias Response = BaseResponse
    var issuesTitle: String
    var issuesBody: String
    var path: String {
        return "repos/\(owner)/\(repoName)/issues"
    }
    var method: HTTPMethod {
        return .post
    }
    
    func parameters() -> [String : String] {
        return ["title": issuesTitle, "body": issuesBody]
    }
    
}
