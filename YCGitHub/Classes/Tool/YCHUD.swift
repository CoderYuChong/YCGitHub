
//
//  YCHUD.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/8.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import SVProgressHUD
import SwiftMessages

class YCHUD: NSObject {
    class func showLoding(with status: String? = nil, maskType: SVProgressHUDMaskType = .none) {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(maskType)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.setMinimumSize(CGSize(width: 84, height: 84))
        SVProgressHUD.show(withStatus: status)
    }
    
    class func hudHide(){
        SVProgressHUD.dismiss()
    }
    
    class func swiftMessagesHide() {
        SwiftMessages.hide()
    }
    class func show(title: String, layout: MessageView.Layout = .cardView, theme: Theme = .warning, duration: SwiftMessages.Duration = .seconds(seconds: 1)) {
        let view: MessageView =  MessageView.viewFromNib(layout: layout)
        view.configureTheme(theme, iconStyle: .light)
        view.configureContent(title: "", body: title)
        view.button?.isHidden = true
        view.bodyLabel?.isHidden = false
        view.titleLabel?.isHidden = true
        view.bodyLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = duration
//        config.
//        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        SwiftMessages.show(config: config, view: view)
        
    }
    
}
