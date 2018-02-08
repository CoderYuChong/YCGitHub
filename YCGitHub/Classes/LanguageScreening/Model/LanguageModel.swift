//
//  LanguageModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import HandyJSON


struct LanguageList: Codable {
    let languageHead: String?
    var languageList: [LanguageModel]
}

struct LanguageModel: Codable {
    let languageColor: String
    let languageName: String
    var check: Bool? = false
}
