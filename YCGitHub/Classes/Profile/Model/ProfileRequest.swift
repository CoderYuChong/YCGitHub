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
    var userName: String?
    var path: String {
        return "user" + ((userName != nil) ? "/\(String(describing: userName))" :  "")
    }
    
}
struct ProfileModel: DecodableJSON {
    let login: String
    let id: Int
    let avatarURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    let name: String
    let company: String?
    let blog: String
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: String
    let updatedAt: String
//    let privateGists: Int
//    let totalPrivateRepos: Int
//    let ownedPrivateRepos: Int
//    let diskUsage: Int
//    let collaborators: Int
//    let twoFactorAuthentication: Bool
//    let plan: Plan
//
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
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
        case type = "type"
        case siteAdmin = "site_admin"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case hireable = "hireable"
        case bio = "bio"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
//        case privateGists = "private_gists"
//        case totalPrivateRepos = "total_private_repos"
//        case ownedPrivateRepos = "owned_private_repos"
//        case diskUsage = "disk_usage"
//        case collaborators = "collaborators"
//        case twoFactorAuthentication = "two_factor_authentication"
//        case plan = "plan"
    }
}

//struct Plan: Codable {
//    let name: String
//    let space: Int
//    let collaborators: Int
//    let privateRepos: Int
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case space = "space"
//        case collaborators = "collaborators"
//        case privateRepos = "private_repos"
//    }
//}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

