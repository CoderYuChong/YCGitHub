

//
//  NetworkAgent.swift
//  NetWork
//
//  Created by YoukaStation on 2017/11/29.
//  Copyright © 2017年 youkastation. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON
extension NetworkAgent {
    @discardableResult
    func request<T: BaseRequest> (_ form: T, hander: @escaping (T.Response?) -> Void) -> DataRequest {
        let url = form.host + form.path
        printLog(url)
        let dataRequest = Alamofire.request(url, method: form.method, parameters: form.parameters(), encoding: form.encoding(), headers: form.headers())
        
        dataRequest.response{ (response) in
            printLog("Request: \(String(describing: response.request))")
            printLog("Response: \(String(describing: response.response))")
            printLog("Error: \(String(describing: response.error))")
            if response.response?.statusCode == 401 {
                
//                UIApplication.topViewController()?.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
                return
            }
            
            if let data = response.data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async { hander(res) }
            } else {
                DispatchQueue.main.async { hander(nil) }
            }
        }
        
        return dataRequest
    }
    
    
//    private F
    
}


protocol NetworkAgent {
    
}






