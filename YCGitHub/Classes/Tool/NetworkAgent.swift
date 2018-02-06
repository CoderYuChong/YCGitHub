

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
        
      
        dataRequest.responseString{ (response) in
            printLog("Request: \(String(describing: response.request))")
            printLog("Response: \(String(describing: response.value))")
            printLog("Error: \(String(describing: response.error))")
            
            if let data = response.value, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async { hander(res) }
            } else {
                DispatchQueue.main.async { hander(nil) }
            }
        }
        
        return dataRequest
    }
    
}


protocol NetworkAgent {
    
}






