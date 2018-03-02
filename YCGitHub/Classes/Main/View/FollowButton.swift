//
//  FollowButton.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/28.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class FollowButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    private func initialize() {
        self.layer.borderColor = UIColor("0xd5d5d5").cgColor
        self.layer.cornerRadius  = 5
        self.layer.masksToBounds = true
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.setTitle("Follow", for: .normal)
                self.setTitleColor(UIColor("0xffffff"), for: .normal)
                self.backgroundColor = UIColor("0x569e3d")
                self.layer.borderWidth = 0
            } else {
                self.setTitle("Unfollow", for: .normal)
                self.setTitleColor(UIColor("0x333333"), for: .normal)
                self.backgroundColor = UIColor("0xeeeeee")
                self.layer.borderWidth = 0
            }
            
        }
    }

}
