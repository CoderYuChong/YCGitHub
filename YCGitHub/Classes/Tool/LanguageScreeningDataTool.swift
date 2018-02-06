//
//  LanguageScreeningDataTool.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

class LanguageScreeningDataTool {

    enum LanguageScreeningType {
        case repositories
        case developer
    }
    
    /// 初始化数据
    class func initializationData() {
        if UserDefaults.LanguageScreeningRepositories.string(forkey: .time).count == 0 {
            UserDefaults.LanguageScreeningRepositories.set(value: since.daily.rawValue, forKey: .time)
        }
        if UserDefaults.LanguageScreeningDeveloper.string(forkey: .time).count == 0 {
            UserDefaults.LanguageScreeningDeveloper.set(value: since.daily.rawValue, forKey: .time)
        }
        
        if UserDefaults.LanguageScreeningRepositories.string(forkey: .language).count == 0 {
            UserDefaults.LanguageScreeningRepositories.set(value: "所有语言", forKey: .language)
        }
        if UserDefaults.LanguageScreeningDeveloper.string(forkey: .language).count == 0 {
            UserDefaults.LanguageScreeningDeveloper.set(value: "所有语言", forKey: .language)
        }
    }
    
   class func saveLanguage(_ languageName: String, screeningType: LanguageScreeningType) {
        switch screeningType {
        case .repositories:
            UserDefaults.LanguageScreeningRepositories.set(value: languageName, forKey: .language)
        case .developer:
            UserDefaults.LanguageScreeningDeveloper.set(value: languageName, forKey: .language)
        }
    }
    
    class func saveTime(_ time: String, screeningType: LanguageScreeningType) {
        switch screeningType {
        case .repositories:
            UserDefaults.LanguageScreeningRepositories.set(value: time, forKey: .time)
        case .developer:
            UserDefaults.LanguageScreeningDeveloper.set(value: time, forKey: .time)
        }
    }

    class func getLanguage(_ screeningType: LanguageScreeningType) -> String {
        switch screeningType {
        case .repositories:
           return UserDefaults.LanguageScreeningRepositories.string(forkey: .language)
        case .developer:
           return UserDefaults.LanguageScreeningDeveloper.string(forkey: .language)
        }
    }
    
    class func getTime(_ screeningType: LanguageScreeningType) -> String {
        switch screeningType {
        case .repositories:
           return UserDefaults.LanguageScreeningRepositories.string(forkey: .time)
        case .developer:
           return UserDefaults.LanguageScreeningDeveloper.string(forkey: .time)
        }
    }
}
