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
        return "https://trendings.herokuapp.com/"
    }
    
    func headers() -> [String : String] {
        return [:]
    }
    
}
