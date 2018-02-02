
//
//  Response.swift
//  NetWork
//
//  Created by YoukaStation on 2017/11/29.
//  Copyright © 2017年 youkastation. All rights reserved.
//

import Foundation
import HandyJSON


public protocol Decodable: HandyJSON {
    static func parse(data: String) -> Self?
    static func keyPath() -> String?
}
extension Decodable {
    static func parse(data: String) -> Self? {
        
      return Self.deserialize(from: data, designatedPath: keyPath())
    }
    
    static func keyPath() -> String? {
        return nil;
    }
}
