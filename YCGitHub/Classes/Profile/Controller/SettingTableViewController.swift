//
//  SettingTableViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import Kingfisher

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var cacheSizeLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateDiskCacheSize()
        tableView.reloadData()
    
    }
    
    private func calculateDiskCacheSize() {
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { (size) in
            let cacheSize = size / 1024 / 1024
            self.cacheSizeLable.text = String(cacheSize) + "MB"
        }
    }
    
    private func clearCache() {
        let cache = KingfisherManager.shared.cache
        cache.clearDiskCache()//清除硬盘缓存
        cache.clearMemoryCache()//清理网络缓存
        cache.cleanExpiredDiskCache()//清理过期的，或者超过硬盘限制大小的
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        let aleart = UIAlertController(title: "确认要退出吗", message: nil, preferredStyle: .alert)
        // 2.创建并添加按钮
        let sureAction = UIAlertAction(title: "确认", style: .default) { (action) in
            
            KeychainTool.clearAccessToken()
            let login = R.storyboard.login.instantiateInitialViewController()!
            UIApplication.shared.delegate?.window??.rootViewController = login
        }
        let cancelAction = UIAlertAction(title: "取消", style: .default) { (action) in
            
        }
        aleart.addAction(sureAction)
        aleart.addAction(cancelAction)

        self.present(aleart, animated: true, completion: nil)
        
    }
    
    deinit {
        print("SettingTableViewController")
    }

}

extension SettingTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            clearCache()
            calculateDiskCacheSize()
            tableView.reloadData()
            YCHUD.show(title: "清理成功", theme: .success)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    
}
