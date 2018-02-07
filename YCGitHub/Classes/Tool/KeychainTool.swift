
//
//  Keychain-Extension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import KeychainAccess


class KeychainTool {
    
   class func accessToken() -> String {
        let keychain = Keychain(service: yc_serviceName)
        guard  let token = try? keychain.getString(yc_accessToken) else {
            return ""
        }
        return token ?? ""
    }
    
    class func setAccessToken(username: String, password: String) {
        let token = "Basic " + (username + ":" + password).base64EncodedString!
        let keychain = Keychain(service: yc_serviceName)
        try? keychain.set(token, key: yc_accessToken)
    }
    
}


