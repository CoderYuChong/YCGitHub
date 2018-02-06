//
//  UIImageView-Extension.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with resource: String?, placeholder: UIImage? = nil) {
        guard let resource = resource else {
            return
        }
        let url = URL(string: resource)
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
