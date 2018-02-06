
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
    var code: String
    var host: String {
        return "https://github.com/login/oauth/access_token?client_id=41099d72ad575c0788fd&client_secret=2c099e24f9589f931f2376646ccf80fe46a4f1ba&code=\(code)&redirect_uri=YCGithub://github.com/CoderYuChong"
    }

    var method: HTTPMethod {
        return .post
    }

}



struct LoginModel: Decodable {
    var access_token: String?
}
