
//
//  TrendingModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import HandyJSON


enum since: String {
    case daily = "今日"
    case weekly = "本周"
    case monthly = "本月"
}

struct TrendingRepositoriesRequest: BaseRequest {

    
    var lang: String? = LanguageScreeningDataTool.getLanguage(.repositories)
    var timeType: since = since(rawValue: LanguageScreeningDataTool.getTime(.repositories)) ?? .daily

    typealias Response = TrendingRepositoriesList
    var path: String {
        return "repo?"
    }
    
    func parameters() -> [String : String] {
        var dic = Dictionary<String, String>()
        dic["lang"] = lang
        dic["since"] = sinceValue(timeType)
        return dic
    }
   private func sinceValue(_ timeType: since) -> String {
        switch timeType {
        case .daily:  return "daily"
        case .weekly:  return "weekly"
        case .monthly:  return "monthly"
        }
    }
    
    
}
struct TrendingRepositoriesList: Decodable {
   
//    static func keyPath() -> String? {
//        return "";
//    }
    
    var items: [TrendingRepositoriesModel]?
}

struct TrendingRepositoriesModel: HandyJSON {
    var repo_link: String?
    var desc: String?
    var repo: String?
    var stars: String?
    var forks: String?
    var lang: String?
    var added_stars: String?
    
}
