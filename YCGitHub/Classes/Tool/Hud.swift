//
//  HUD.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/7.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages
class Hud {
//    class func showLoding(){
//        var config = SwiftMessages.defaultConfig
//        config.presentationStyle = .center
//        config.duration = .forever
//        config.presentationContext = .window(windowLevel: UIWindowLevelAlert)
//        SwiftMessages.show(config: config, view: R.nib.lodingView.firstView(owner: nil)!)
//    }
    
    class func hide() {
        SwiftMessages.hide()
    }
    class func show(title: String, layout: MessageView.Layout = .cardView, theme: Theme = .warning, duration: SwiftMessages.Duration = .seconds(seconds: 1)) {
        let view: MessageView =  MessageView.viewFromNib(layout: layout)
        view.configureTheme(theme, iconStyle: .light)
        view.configureContent(title: title, body: "")
        view.button?.isHidden = true
        view.bodyLabel?.isHidden = true
        
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = duration
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        SwiftMessages.show(config: config, view: view)

    }
}
