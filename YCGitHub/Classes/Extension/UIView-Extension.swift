
//
//  UIView-Extension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/27.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func superViewController() -> UIViewController? {
        var next: UIResponder?
        next = self.next!
        while next != nil {
            //2.判断响应者对象是否是视图控制器类型
            if ((next as?UIViewController) != nil) {
                return (next as! UIViewController)
            }else {
                next = next?.next
            }
            
        }
         return nil
    }
}
