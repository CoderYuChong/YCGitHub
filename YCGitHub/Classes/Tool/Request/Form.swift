

//
//  Form.swift
//  NetWork
//
//  Created by YoukaStation on 2017/11/29.
//  Copyright © 2017年 youkastation. All rights reserved.
//

import Foundation
import Alamofire

extension BaseRequest {
    func encoding() -> ParameterEncoding {
        return Alamofire.URLEncoding.default
    }
    
    func parameters() -> [String: String] {
        return [:]
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        return ""
    }
}


protocol BaseRequest: NetworkConfig {
    associatedtype Response: Decodable
    var path: String { get }
    func encoding() -> ParameterEncoding
    func parameters() -> [String: String]
}


protocol NetworkConfig {
    var host: String { get }
    var method: Alamofire.HTTPMethod { get }
    func headers() -> [String: String]
}
