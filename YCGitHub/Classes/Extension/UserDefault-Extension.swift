
//
//  UserDefault-Extension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

protocol UserDefaultNameSpace {  }

extension UserDefaultNameSpace {
    static func nameSpace<T>(_ key: T) -> String where T: RawRepresentable {
        return "\(Self.self).\(key.rawValue)"
    }
}

protocol UserDefaultSettable: UserDefaultNameSpace {
    associatedtype UserDefaultKey: RawRepresentable
}
extension UserDefaultSettable where UserDefaultKey.RawValue == String{}

extension UserDefaultSettable {
     /// 关于 Int 类型存储和读取
    static func set(value: Int, forKey key: UserDefaultKey) {
        let key = nameSpace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    static func integer(forkey key: UserDefaultKey) -> Int {
        return UserDefaults.standard.integer(forKey: nameSpace(key))
    }
    
    /// 关于 String 类型存储和读取
    static func set(value: Any?, forKey key: UserDefaultKey) {
        let key = nameSpace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    static func string(forkey key: UserDefaultKey) -> String {
        return UserDefaults.standard.string(forKey: nameSpace(key)) ?? ""
    }
}

extension UserDefaults {
    
    struct LanguageScreeningDeveloper: UserDefaultSettable {
        enum UserDefaultKey: String {
            case language
            case time
        }
    }
    
    struct LanguageScreeningRepositories: UserDefaultSettable {
        enum UserDefaultKey: String {
            case language
            case time
        }
    }
}
