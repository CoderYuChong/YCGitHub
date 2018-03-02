//
//  FindeCon.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/8.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit


extension UIApplication {
    /* 递归找最上面的viewController */
    class func topViewController() -> UIViewController? {
        
        return self.topViewControllerWithRootViewController(viewController: self.getCurrentWindow()?.rootViewController)
    }
    
   class func topViewControllerWithRootViewController(viewController :UIViewController?) -> UIViewController? {
        
        if viewController == nil {
            
            return nil
        }
        
        if viewController?.presentedViewController != nil {
            
            return self.topViewControllerWithRootViewController(viewController: viewController?.presentedViewController!)
        }
        else if viewController?.isKind(of: UITabBarController.self) == true {
            
            return self.topViewControllerWithRootViewController(viewController: (viewController as! UITabBarController).selectedViewController)
        }
        else if viewController?.isKind(of: UINavigationController.self) == true {
            
            return self.topViewControllerWithRootViewController(viewController: (viewController as! UINavigationController).visibleViewController)
        }
        else {
            
            return viewController
        }
    }
    // 找到当前显示的window
    class func getCurrentWindow() -> UIWindow? {
        
        // 找到当前显示的UIWindow
        var window: UIWindow? = self.shared.keyWindow
        /**
         window有一个属性：windowLevel
         当 windowLevel == UIWindowLevelNormal 的时候，表示这个window是当前屏幕正在显示的window
         */
        if window?.windowLevel != UIWindowLevelNormal {
            
            for tempWindow in UIApplication.shared.windows {
                
                if tempWindow.windowLevel == UIWindowLevelNormal {
                    
                    window = tempWindow
                    break
                }
            }
        }
        
        return window
    }

    
}

