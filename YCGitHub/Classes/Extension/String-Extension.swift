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
                return tagValue
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



// MARK: - Base64
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





// MARK: - 日期处理
extension String {
    func timeString() -> String {
        
        // 1.创建时间格式化对象
        let fmt = DateFormatter()
        
        fmt.locale = Locale(identifier: "en")
        //        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        // 2.获取时间
        
        guard let createDate = fmt.date(from: self) else {
            return ""
        }
        
        // 3.获取当前时间
        let nowDate = Date()
        
        // 4.获取创建时间和当前时间差
        let interval = Int(nowDate.timeIntervalSince(createDate))
        
        // 5.判断时间显示的格式
        // 5.1.1分钟之内
        if interval < 60 {
            return "刚刚"
        }
        
        // 5.2.一个小时内
        if interval < 60 * 60 {
            
            return "\(interval / 60) minutes ago"
        }
        
        // 5.3.一天之内
        if interval < 60 * 60 * 24 {
            return "\(interval / 60 / 60) hours ago"
        }
        
        // 6.其他时间的显示
        // 6.1.创建日期对象
        let calendar = NSCalendar.current
        
        // 6.2.昨天的显示
        if calendar.isDateInYesterday(createDate) {
            fmt.dateFormat = "HH:mm"
            let timeString = fmt.string(from: createDate)
            return "yesterday \(timeString)"
        }
        
        let cpns = calendar.dateComponents([.year], from: createDate, to: nowDate)
        if cpns.year! < 1 {
            fmt.dateFormat = "MM-dd HH:mm"
            let timeString = fmt.string(from: createDate)
            return timeString
        }
        //
        //        // 6.4.一年以上
        fmt.dateFormat = "yyyy-MM-dd HH:mm"
        let timeString = fmt.string(from: createDate)
        
        return timeString
    }
}




