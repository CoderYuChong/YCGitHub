//
//  YCRefreshNormalHeader.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/3.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import MJRefresh



extension UIScrollView {
    func headerRefresh(target: Any, refreshingAction: Selector, beginRefreshing: Bool = true){
        let header =  MJRefreshNormalHeader()
        header.stateLabel.isHidden = true
        header.lastUpdatedTimeLabel.isHidden = true
        header.arrowView.image = R.image.tabbar_home_normal()
        header.setRefreshingTarget(target, refreshingAction: refreshingAction)
        self.mj_header = header
        if beginRefreshing {
            self.mj_header.beginRefreshing()
        }
        
    }
    func bottomRefresh(target: Any, refreshingAction: Selector, automaticallyRefresh: Bool = true, triggerAutomaticallyRefreshPercent: CGFloat = 1.0) {
        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
        let footer = MJRefreshAutoNormalFooter(refreshingTarget: target, refreshingAction: refreshingAction)
        // 禁止自动加载
        footer?.isAutomaticallyRefresh = automaticallyRefresh
        // 当底部控件出现多少时就自动刷新(默认为1.0，也就是底部控件完全出现时，才会自动刷新)
        footer?.triggerAutomaticallyRefreshPercent = triggerAutomaticallyRefreshPercent
        // 设置footer
        self.mj_footer = footer
        
    }
    
    
    
    
}

