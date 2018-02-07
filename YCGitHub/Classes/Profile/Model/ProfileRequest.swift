//
//  ProfileRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import HandyJSON

struct ProfileRequest: BaseRequest {
    typealias Response = ProfileModel
    var path: String {
        return "user"
    }
    
}

struct ProfileModel: Decodable{
    var avatarUrl: String?
    var bio: String?
    var blog: String?
    var collaborators: Int?
    var company: String?
    var createdAt: String?
    var diskUsage: Int?
    var email: String?
    var eventsUrl: String?
    var followers: Int?
    var followersUrl: String?
    var following: Int?
    var followingUrl: String?
    var gistsUrl: String?
    var gravatarId: String?
    var hireable: Bool?
    var htmlUrl: String?
    var id: Int?
    var location: String?
    var login: String?
    var name: String?
    var organizationsUrl: String?
    var ownedPrivateRepos: Int?
    var plan: Plan?
    var privateGists: Int?
    var publicGists: Int?
    var publicRepos: Int?
    var receivedEventsUrl: String?
    var reposUrl: String?
    var siteAdmin: Bool?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var totalPrivateRepos: Int?
    var twoFactorAuthentication: Bool?
    var type: String?
    var updatedAt: String?
    var url: String?
    mutating func mapping(mapper: HelpingMapper) {
     
        mapper <<<
            self.avatarUrl <-- "avatar_url"
        mapper <<<
            self.updatedAt <-- "updated_at"
        mapper <<<
            self.createdAt <-- "created_at"
        mapper <<<
            self.diskUsage <-- "disk_usage"
        mapper <<<
            self.eventsUrl <-- "events_url"
        mapper <<<
            self.followersUrl <-- "followers_url"
        mapper <<<
            self.followingUrl <-- "following_url"
        mapper <<<
            self.gistsUrl <-- "gists_url"
        mapper <<<
            self.htmlUrl <-- "html_url"
        mapper <<<
            self.organizationsUrl <-- "organizations_url"
        mapper <<<
            self.ownedPrivateRepos <-- "owned_private_repos"
        mapper <<<
            self.privateGists <-- "private_gists"
        mapper <<<
            self.publicGists <-- "public_gists"
        mapper <<<
            self.publicRepos <-- "public_repos"
        mapper <<<
            self.receivedEventsUrl <-- "received_events_url"
        mapper <<<
            self.reposUrl <-- "repos_url"
        mapper <<<
            self.siteAdmin <-- "site_admin"
        mapper <<<
            self.starredUrl <-- "starred_url"
        mapper <<<
            self.subscriptionsUrl <-- "subscriptions_url"
        mapper <<<
            self.totalPrivateRepos <-- "total_private_repos"
        mapper <<<
            self.twoFactorAuthentication <-- "two_factor_authentication"
        
    }
    
}


struct Plan: HandyJSON{
    var collaborators: Int?
    var name: String?
    var privateRepos: Int?
    var space: Int?
}

