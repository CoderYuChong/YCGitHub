
//
//  LoginRequest.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import Alamofire

struct LoginRequest: BaseRequest {
    typealias Response = LoginModel
    //https://api.github.com/authorizations/clients/ef5834ea86b53233dc4
    var passWorld = "yuchong5520"
    var account = "13088861503@163.com"
    
    var host: String {
        return "https://api.github.com/"
    }
    var path: String {
        return "authorizations/clients/" + clientID
    }
    func parameters() -> [String : String] {
        return ["client_secret": clientSecret]
    }
    var method: HTTPMethod {
        return .put
    }
    
    func headers() -> [String : String] {
        return ["Authorization": "Basic MTMwODg4NjE1MDNAMTYzLmNvbTp5dWNob25nNTUyMA==",
                "Accept": "application/vnd.github.mirage-preview+json",
                "Content-Type": "application/json; charset=utf-8"]
    }


}



struct LoginModel: Decodable {

}
