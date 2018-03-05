//
//  RepositoriesState.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import Alamofire

class RepositoriesStateRequest: BaseRequest {
    typealias Response = BaseResponse
    
    enum Action: String {
        case starred = "starred"
        case watch = "subscriptions"
    }
    
    enum Following {
        case Following
        case Unfollowing
        case CheckFollow
    }
    var path: String {
        return "user/\(action.rawValue)/\(userName)"
    }
    var method: HTTPMethod {
        switch followingAction {
        case .Following:
            return .put
        case .Unfollowing:
            return .delete
        case .CheckFollow:
            return .get
        }
    }
    
    var userName: String
    var followingAction: Following
    var action: Action
    
    init(_ userName: String, action: Action, followingAction: Following) {
        self.userName = userName
        self.followingAction = followingAction
        self.action = action
    }
}

