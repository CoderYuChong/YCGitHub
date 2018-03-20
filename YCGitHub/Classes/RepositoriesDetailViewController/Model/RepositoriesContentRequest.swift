//
//  RepositoriesContentRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit

class RepositoriesContentRequest: BaseRequest {
    typealias Response = RepositoriesContent
    var path: String {
//        let temp = "repos/\(repositoriesName)/contents/\(contentsPath)"
//        return temp.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//        return temp.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet)
        return "repos/\(repositoriesName)/contents/\(contentsPath)"
    }
    
    var repositoriesName: String
    var contentsPath: String
    
    init(_ repositoriesName: String, contentsPath: String = "") {
        self.repositoriesName = repositoriesName
        self.contentsPath = contentsPath
    }
}

struct RepositoriesContent: DecodableJSON {
    var data: [RepositoriesContentModel]
    
}

struct RepositoriesContentModel: Codable {
    let name, path, sha: String
    let size: Int
    let url, htmlURL, gitURL: String
    let downloadURL: String?
    let type: FileType
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case name, path, sha, size, url
        case htmlURL = "html_url"
        case gitURL = "git_url"
        case downloadURL = "download_url"
        case type
        case links = "_links"
    }
    
    enum FileType: String, Codable {
        case dir
        case file
        case unknown
    }

    var imageIcon: UIImage? {
        if type == .file {
            let exten = (name as NSString).pathExtension
            if exten == "md" {
                return R.image.icon_file_markdown()
            } else if exten == "text" {
                return R.image.icon_file_text()
            } else if exten == "jpg" || exten == "png" || exten == "gif" {
                return R.image.icon_file_image()
            } else if exten.count == 0 {
                return R.image.icon_file_data()
            } else {
                return R.image.icon_file_code()
            }
        }
        return R.image.icon_file_dir()
    }
}

struct Links: Codable {
    let linksSelf, git, html: String
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case git, html
    }
}
//struct RepositoriesContentModel: Codable {
//
//}

