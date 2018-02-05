//
//  LanguageModel.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import HandyJSON


struct LanguageList: HandyJSON {
    var languageHead: String?
    var languageList: [LanguageModel]?
}

struct LanguageModel: HandyJSON {
    var languageColor: String?
    var languageName: String?
    var check: Bool = false
}
