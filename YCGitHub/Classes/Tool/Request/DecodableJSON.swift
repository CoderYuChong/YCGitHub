
//
//  Response.swift
//  NetWork
//
//  Created by YoukaStation on 2017/11/29.
//  Copyright © 2017年 youkastation. All rights reserved.
//

import Foundation
import HandyJSON


public protocol DecodableJSON: Codable {
    static func parse(data: Data) -> Self?
//    static func keyPath() -> String?
}
extension DecodableJSON {
    static func parse(data: Data) -> Self? {
        var tempData = data
        guard let jsonData = try? JSONSerialization.jsonObject(with: tempData, options: []) else {
            return nil
        }

        if ((jsonData as? Dictionary<String,Any>) == nil) {
            let dic = ["data": jsonData]
            guard let dicData = try? JSONSerialization.data(withJSONObject: dic, options: []) else {
                return nil
            }
            tempData = dicData
        }
        let jsonDecoder = JSONDecoder()
        do {
            let user = try jsonDecoder.decode(self, from: tempData)
            return user
        } catch {
            print(error)
            return nil
        }
        
      
//      return Self.deserialize(from: data, designatedPath: keyPath())
    }

    
//    static func keyPath() -> String? {
//        return nil
//    }
}


