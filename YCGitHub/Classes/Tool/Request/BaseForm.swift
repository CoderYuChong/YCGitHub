//
//  BaseForm.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

extension NetworkConfig {
    
    var host: String {
        return "https://api.github.com/"
    }
    
    func headers() -> [String : String] {
        let token = KeychainTool.accessToken()
        if token.count == 0  {
            return [:]
        }
        printLog("--Authorization token:\(token)--")
        return ["Authorization": token]
    }
    
}
