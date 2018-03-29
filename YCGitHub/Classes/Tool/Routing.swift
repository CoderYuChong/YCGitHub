
//
//  Routing.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/23.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit


struct Routing {
    
    static func aboutViewController() -> UIViewController {
        return R.storyboard.profile.aboutViewController()!
    }
    
    static func repositoriesDetailTableViewController(_ repositoriesName: String, repositoriesModel: RepositoriesModel? = nil) -> UIViewController {
        let repoVC = RepositoriesDetailTableViewController()
        repoVC.repositoriesName = repositoriesName
        repoVC.repositoriesModel = repositoriesModel
        return repoVC
    }
    
    static func profileViewController(_ userName: String, profileViewType: ProfileViewType = .mine) -> UIViewController {
        let profileVC = R.storyboard.profile.profileViewController()!
        profileVC.userName = userName
        profileVC.profileViewType = profileViewType
        profileVC.title = userName
        return profileVC
    }
    
    static func feedBackViewController() -> UIViewController {
        return R.storyboard.profile.feedBackViewController()!
    }
    
    static func loginOAuthController(result: @escaping (Bool) -> ()) -> UIViewController {
        let loginVC = LoginOAuthController()
        loginVC.loginResult = result
        return loginVC
    }
    
    static func repositoriesViewController(_ repositoriesPath: String) -> UIViewController {
        let repositoriesVC = RepositoriesViewController()
        repositoriesVC.repositoriesPath = repositoriesPath
        return repositoriesVC
    }
    
    static func developerViewController(_ developerPath: String) -> UIViewController {
        let develpoerVC = DeveloperViewController()
        develpoerVC.developerPath = developerPath
        return develpoerVC
    }
    
    static func repositoriesContentViewController(_ repositoriesName: String, contentsPath: String, contentName: String) -> UIViewController {
        let repoContentVC = RepositoriesContentViewController()
        repoContentVC.repositoriesName = repositoriesName
        repoContentVC.contentsPath = contentsPath
        repoContentVC.title = contentName
        return repoContentVC
    }
    
    
    static func fileContentViewController(htmlURL: String, contentName: String) -> UIViewController {
        let fileVC =  FileContentViewController()
        fileVC.htmlUrl = htmlURL
        fileVC.title = contentName
        return fileVC
    }
    
    
}
