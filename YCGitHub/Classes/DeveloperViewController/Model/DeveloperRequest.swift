//
//  DeveloperRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/27.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

class DeveloperFollowingRequest: BaseRequest {
    typealias Response = BaseResponse
    var userName: String
    var path: String {
        return "user/following/\(userName)"
    }
    init(_ userName: String) {
        self.userName = userName
    }
}


class DeveloperRequest: BaseRequest {
    typealias Response = Developer
    var developerPath: String
    var page: Int
    var path: String {
        return developerPath
    }
    func parameters() -> [String : String] {
        return  ["page": String(page)]
    }
    
    init(_ developerPath: String) {
        self.developerPath = developerPath
        self.page = 1
    }
    
}


struct Developer: DecodableJSON {
    var data: [DeveloperModel]
}

struct DeveloperModel: Codable {
    let login: String
    let id: Int
    let avatarURL, gravatarID, url, htmlURL: String
    let followersURL, followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL, eventsURL: String
    let receivedEventsURL, type: String
    let siteAdmin: Bool
    
//    /// 是否follow
//    var following: Bool?
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}
