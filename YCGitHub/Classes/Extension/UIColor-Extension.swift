//
//  UIColor-Ectension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    convenience init(_ hexString: String, alpha: CGFloat = 1.0) {
        var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        guard cString.count >= 6 else {
            self.init(r: 0, g: 0, b: 0)
            return
        }
        if cString.hasPrefix("0X") {
            cString = cString.substring(from: 2)
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: 1)
        }
        guard cString.count == 6 else {
            self.init(r: 0, g: 0, b: 0)
            return
        }
        
        let rString = cString.subString(start: 0, length: 2)
        let gString = cString.subString(start: 2, length: 2)
        let bString = cString.subString(start: 4)

        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        printLog(CGFloat(r))

        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), alpha: alpha)
    }
    
}
