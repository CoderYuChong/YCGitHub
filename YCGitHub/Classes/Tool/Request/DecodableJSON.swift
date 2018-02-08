
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
        let jsonDecoder = JSONDecoder()
        let user = try? jsonDecoder.decode(self, from: data)
        return user
//      return Self.deserialize(from: data, designatedPath: keyPath())
    }
    
//    static func keyPath() -> String? {
//        return nil;
//    }
}


