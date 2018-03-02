//
//  ExampleBasicContentView.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/9.
//  Copyright © 2017年 Vincent Li. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class ExampleBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor("#76808E")
        highlightTextColor = themeColor
        iconColor = UIColor("#76808E")
        highlightIconColor = themeColor
        backgroundColor = tabBarbackgroundColor
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
