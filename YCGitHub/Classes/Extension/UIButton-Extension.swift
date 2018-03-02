//
//  UIButton.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIButton {
    
    func setImage(with resource: String?,
                  for state: UIControlState,
                  placeholder: UIImage? = nil,
                  options: KingfisherOptionsInfo? = nil,
                  progressBlock: DownloadProgressBlock? = nil,
                  completionHandler: CompletionHandler? = nil) {
        
        guard let resource = resource else {
            return
        }
        let url = URL(string: resource)
        self.kf.setImage(with: url, for: state, placeholder: placeholder, options: options, progressBlock: progressBlock, completionHandler: completionHandler)
    }
    
    
    func setBackgroundImage(with resource: String?,
                            for state: UIControlState,
                            placeholder: UIImage? = nil,
                            options: KingfisherOptionsInfo? = nil,
                            progressBlock: DownloadProgressBlock? = nil,
                            completionHandler: CompletionHandler? = nil) {
        guard let resource = resource else {
            return
        }
        let url = URL(string: resource)
        self.kf.setBackgroundImage(with: url, for: state, placeholder: placeholder, options: options, progressBlock: progressBlock, completionHandler: completionHandler)
    }
}
