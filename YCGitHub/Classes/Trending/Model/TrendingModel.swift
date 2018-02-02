
//
//  TrendingModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import HandyJSON
struct TrendingRequest: BaseRequest {
    
    var lang: String
    enum since: String {
        case daily
        case weekly
        case monthly
    }
    
    typealias Response = TrendingList
    var path: String {
        return "repo?"
    }
    func parameters() -> [String : String] {
        var dic = Dictionary<String, String>()
        dic["lang"] = lang
        dic["since"] = "weekly"
        return dic
    }
    
    
}
struct TrendingList: Decodable {
   
    static func keyPath() -> String? {
        return "items";
    }
    
    var items: [TrendingModel]?

}

struct TrendingModel: HandyJSON {
    var repo_link: String?
    var desc: String?
    var repo: String?
    var stars: String?
    var forks: String?
    var lang: String?
    var added_stars: String?

    
}
