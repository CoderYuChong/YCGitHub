//
//  RequestManager.swift
//  Request
//
//  Created by YoukaStation on 2017/8/10.
//  Copyright © 2017年 youkastation. All rights reserved.
//  https://onevcat.com/2016/12/pop-cocoa-2/


import UIKit
import Foundation
import Alamofire


//protocol NetworkConfig {
//    var host: String { get }
//    var method: HTTPMethod { get }
//    func headers() -> [String: String]
//}
//
//extension NetworkConfig {
//    var host: String {
//        return "http://api.githup.com/"
//    }
//    func headers() -> [String: String] {
//        return [:]
//    }
//}
//
//extension BaseRequest {
//    func encoding() -> ParameterEncoding {
//        return Alamofire.URLEncoding.default
//    }
//    
//    func parameters() -> [String: String] {
//        return [:]
//    }
//    
//    var method: HTTPMethod {
//        return .get
//    }
//    var path: String {
//        return ""
//    }
//    
//}
//
//
//protocol BaseRequest: NetworkConfig {
//    associatedtype Response: Decodable
//    var path: String { get }
//    func encoding() -> ParameterEncoding
//    func parameters() -> [String: String]
//}
//
//
//@discardableResult
//func send<T: BaseRequest>(_ r: T, hander: @escaping (T.Response?) -> Void) -> DataRequest {
//    let url = URL(string: r.host.appending(r.path))!
//    
//   let dataRequest = Alamofire.request(url,method: r.method).responseString { response in
//        if let data = response.value, let res = T.Response.parse(data: data) {
//            DispatchQueue.main.async {hander(res)}
//        } else {
//            DispatchQueue.main.async {hander(nil)}
//        }
//    }
//    return dataRequest
//}
//

//
//protocol Client {
//    func send<T: BaseRequest>(_ r: T, hander: @escaping (T.Response?) -> Void)
//}
//
//extension Client {
//    func send<T>(_ r: T, hander: @escaping (T.Response?) -> Void) where T: BaseRequest {
//        let url = URL(string: r.host.appending(r.path))!
//        Alamofire.request(url,method: r.method).responseString { response in
//            if let data = response.value, let res = T.Response.parse(data: data) {
//                DispatchQueue.main.async {hander(res)}
//            } else {
//                DispatchQueue.main.async {hander(nil)}
//            }
//        }
//    }
//}
//
//
//
//struct URLSessionClient: Client {
//    
//    static let shared = URLSessionClient()
//    private init() { }
//}
//










