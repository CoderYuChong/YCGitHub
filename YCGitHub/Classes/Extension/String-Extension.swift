//
//  String-Extension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation

extension String {
    
    func urlOfKey(key: String) -> String {
        
        if self.isEmpty {
            return ""
        }
        let regexString = "(^|&|\\?)+\(key)=+([^&]*)(&|$)"
        guard let regex = try? NSRegularExpression(pattern: regexString, options: .caseInsensitive) else {
            return ""
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        
        for match in matches {
            let range = match.range(at: 2)
            let tagValue = self.subString(start: range.location, length: range.length)
                return tagValue;
        }
        return ""
    }
    
    public func substring(from index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    
    public func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 || length + start > self.count {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
}
extension String {
    /// Encode a String to Base64
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    /// Decode a String from Base64. Returns nil if unsuccessful.
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
extension String {
    var data: Data {
        return Data(utf8)
    }
    var base64Decoded: Data? {
        return Data(base64Encoded: self)
    }
    var base64EncodedString: String? {
        return data.base64EncodedData().string
    }
    var base64DecodedString: String? {
        return Data(base64Encoded: self)?.string
    }
}

extension Data {
    var string: String? { return String(data: self, encoding: .utf8) }
}
