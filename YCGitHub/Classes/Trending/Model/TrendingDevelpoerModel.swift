//
//  TrendingDevelpoerModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import HandyJSON

struct TrendingDevelpoerRequest: BaseRequest {
    
    
    var lang: String? = LanguageScreeningDataTool.getLanguage(.developer)
    var timeType: since = since(rawValue: LanguageScreeningDataTool.getTime(.developer)) ?? .daily
    
    typealias Response = TrendingDevelpoerList
    var host: String {
        return "https://trendings.herokuapp.com/"
    }
    
    var path: String {
        return "developer"
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
struct TrendingDevelpoerList: DecodableJSON {

    var items: [TrendingDevelpoerModel]
}

struct TrendingDevelpoerModel: Codable {
    var developer_avatar: String?
    var full_name: String?
    var user: String?
    var user_link: String?
    
}
